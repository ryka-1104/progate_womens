import 'package:flutter/material.dart';
import 'package:progate_womens/component/list_component.dart';
import 'package:progate_womens/component/stamp_component.dart';

class CreatureDialog extends StatelessWidget {
  const CreatureDialog({
    super.key,
    required this.stamp,
    required this.name,
    required this.detail,
    required this.goodsTitle,
    required this.itemComponent,
    this.onClose,
  });

  final Widget stamp;
  final String name;
  final String detail;
  final String goodsTitle;
  final Widget itemComponent;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFF0F0F0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: onClose ?? () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                  color: const Color(0xFF6E6E6E),
                  splashRadius: 20,
                  tooltip: '閉じる',
                ),
              ),
              Center(child: stamp),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF373737),
                    height: 1.15,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                detail,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF373737),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                goodsTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF373737),
                ),
              ),
              const SizedBox(height: 8),
              itemComponent,
            ],
          ),
        ),
      ),
    );
  }
}

class SampleCreatureDialog extends StatelessWidget {
  const SampleCreatureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CreatureDialog(
      stamp: StampComponent(
        size: 240,
        isActive: true,
        image: Container(
          color: const Color(0xFFB6DFFF),
          child: const Center(
            child: Icon(
              Icons.set_meal_outlined,
              color: Color(0xFF2D5ACB),
              size: 72,
            ),
          ),
        ),
      ),
      name: 'ピンクのお魚さん',
      detail: 'カラフルな体色が特徴の、元気に泳ぐかわいい魚です。',
      goodsTitle: 'この生き物に関するグッズ',
      itemComponent: const GoodsListComponent(
        photo: ColoredBox(
          color: Color(0xFFC7DFF4),
          child: Center(
            child: Icon(
              Icons.image_outlined,
              color: Color(0xFF4E6A83),
              size: 34,
            ),
          ),
        ),
        goodsName: 'グッズ名',
        categoryLabel: '商品カテゴリーラベル',
        price: '¥2,800',
        isSaved: false,
      ),
    );
  }
}

// ファイルの一番下に追加してください
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: Center(child: SampleCreatureDialog())),
    ),
  );
}
