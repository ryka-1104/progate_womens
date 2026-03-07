import 'package:flutter/material.dart';
import 'package:progate_womens/component/stamp_component.dart';
import 'package:progate_womens/stamp/stamp_service.dart';
import 'package:progate_womens/logic/aquarium_logic.dart';

/// 未収集スタンプ用の魚画像パス。
/// `lib/assets/images/stamps/fish.png` を表示します。
/// 画像が存在しない場合はアイコンで表示されます。
const _uncollectedStampImagePath = 'lib/assets/images/stamps/fish.png';

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
      final exhibits = AquariumService.getExhibits()
          .cast<Map<String, dynamic>>();

      final ids = await StampService.getCollectedIds();

      setState(() {
        _exhibits = exhibits;
        _collectedIds = ids.toSet();
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
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB), Color(0xFF90CAF9)],
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
                        delegate: SliverChildBuilderDelegate((context, index) {
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
                            onTap: () {
                              // タップで詳細ダイアログなどを開く場合はここで
                            },
                          );
                        }, childCount: _exhibits.length),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 24)),
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
    this.onTap,
  });

  final String shortName;
  final bool collected;
  final String? stampImagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image =
        collected && stampImagePath != null && stampImagePath!.isNotEmpty
        ? Image.asset(
            stampImagePath!,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _placeholderImage(),
          )
        : _placeholderImage();

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
            color: collected ? Colors.grey.shade800 : Colors.grey.shade500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _placeholderImage() {
    return Image.asset(_uncollectedStampImagePath, fit: BoxFit.cover);
  }
}
