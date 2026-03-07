import 'package:flutter/material.dart';

class GoodsListComponent extends StatelessWidget {
  const GoodsListComponent({
    super.key,
    required this.photo,
    required this.goodsName,
    required this.categoryLabel,
    required this.price,
    required this.isSaved,
    this.onSavePressed,
  });

  final Widget photo;
  final String goodsName;
  final String categoryLabel;
  final String price;
  final bool isSaved;
  final VoidCallback? onSavePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.35),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 92,
            height: 92,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: photo,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  goodsName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  categoryLabel,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6E6E6E),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onSavePressed,
            icon: Icon(
              isSaved ? Icons.bookmark : Icons.bookmark_border,
              color: const Color(0xFF8B8B8B),
              size: 28,
            ),
            splashRadius: 20,
            tooltip: '保存',
          ),
        ],
      ),
    );
  }
}

class SampleGoodsListComponent extends StatelessWidget {
  const SampleGoodsListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GoodsListComponent(
      photo: Container(
        color: const Color(0xFFC7DFF4),
        child: const Center(
          child: Icon(Icons.image_outlined, color: Color(0xFF4E6A83), size: 34),
        ),
      ),
      goodsName: 'グッズ名',
      categoryLabel: '商品カテゴリーラベル',
      price: '¥2,800',
      isSaved: false,
      onSavePressed: () {},
    );
  }
}
