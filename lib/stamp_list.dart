import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progate_womens/component/stamp_component.dart';
import 'package:progate_womens/stamp/stamp_service.dart';

Future<Map<String, dynamic>> _loadAquariumJson() async {
  final data = await rootBundle.loadString('lib/aquarium.json');
  return jsonDecode(data) as Map<String, dynamic>;
}

/// 未収集スタンプ用の魚画像パス。
/// 魚の画像を用意する場合: 画像を lib/assets/images/stamps/ に配置し、
/// 以下のファイル名にしてください（例: uncollected_fish.png）。
/// 画像がない場合はアイコンで表示されます。
const _uncollectedStampImagePath = 'lib/assets/images/stamps/uncollected_fish.png';

/// 「集めた生き物たち」スタンプ一覧画面。
/// aquarium.json の exhibits と StampService の収集状態を連携して表示します。
class StampListPage extends StatefulWidget {
  const StampListPage({super.key});

  @override
  State<StampListPage> createState() => _StampListPageState();
}

class _StampListPageState extends State<StampListPage> {
  List<Map<String, dynamic>> _exhibits = [];
  Set<String> _collectedIds = {};
  bool _loading = true;
  String? _error;
  /// 未収集用の魚画像が assets に存在するか
  bool _hasUncollectedImage = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final json = await _loadAquariumJson();
      final exhibits =
          (json['exhibits'] as List).cast<Map<String, dynamic>>();
      final ids = await StampService.getCollectedIds();
      final hasImage = await rootBundle
          .load(_uncollectedStampImagePath)
          .then((_) => true)
          .catchError((_, __) => false);
      setState(() {
        _exhibits = exhibits;
        _collectedIds = ids.toSet();
        _hasUncollectedImage = hasImage;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  /// 展示名から短いラベルを取得（例: 「クラゲ展示」→「クラゲ」）
  static String _shortName(String name) {
    return name.replaceAll('展示', '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFBBDEFB),
              Color(0xFF90CAF9),
            ],
          ),
        ),
        child: SafeArea(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          '読み込みに失敗しました: $_error',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                            child: Text(
                              '集めた生き物たち',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.85,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final exhibit = _exhibits[index];
                                final id = exhibit['id'] as String;
                                final name = exhibit['name'] as String;
                                final collected = _collectedIds.contains(id);
                                final stampImagePath =
                                    exhibit['stamp_image'] as String?;

                                return _StampGridItem(
                                  shortName: _shortName(name),
                                  collected: collected,
                                  stampImagePath: stampImagePath,
                                  useCustomUncollectedImage: _hasUncollectedImage,
                                  onTap: () {
                                    // タップで詳細ダイアログなどを開く場合はここで
                                  },
                                );
                              },
                              childCount: _exhibits.length,
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 24),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}

class _StampGridItem extends StatelessWidget {
  const _StampGridItem({
    required this.shortName,
    required this.collected,
    required this.stampImagePath,
    this.useCustomUncollectedImage = false,
    this.onTap,
  });

  final String shortName;
  final bool collected;
  final String? stampImagePath;
  /// 未収集時に魚画像（uncollected_fish.png）を使うか。false のときはアイコン表示
  final bool useCustomUncollectedImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = collected && stampImagePath != null && stampImagePath!.isNotEmpty
        ? Image.asset(
            stampImagePath!,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _placeholderImage(useCustomImage: false),
          )
        : _placeholderImage(useCustomImage: useCustomUncollectedImage);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StampComponent(
          size: 88,
          isActive: collected,
          image: image,
          onTap: onTap,
        ),
        const SizedBox(height: 8),
        Text(
          shortName,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: collected
                ? Colors.grey.shade800
                : Colors.grey.shade500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _placeholderImage({required bool useCustomImage}) {
    if (!useCustomImage) return _defaultPlaceholderIcon();
    return Image.asset(
      _uncollectedStampImagePath,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _defaultPlaceholderIcon(),
    );
  }

  /// 未収集用画像がない場合のフォールバック（魚アイコン）
  Widget _defaultPlaceholderIcon() {
    return Container(
      color: const Color(0xFFEAF2FF),
      child: Center(
        child: Icon(
          Icons.pets,
          size: 36,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
