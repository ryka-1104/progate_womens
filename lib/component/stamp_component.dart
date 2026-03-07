import 'package:flutter/material.dart';

class StampComponent extends StatelessWidget {
  const StampComponent({
    super.key,
    required this.image,
    this.size = 88,
    this.isActive = false,
    this.onTap,
  });

  final Widget image;
  final double size;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final stamp = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFEAF2FF),
        border: Border.all(
          color: isActive ? const Color(0xFF2D5ACB) : const Color(0xFFD0D8E7),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipOval(child: image),
    );

    if (onTap == null) {
      return stamp;
    }

    return GestureDetector(onTap: onTap, child: stamp);
  }
}

class SampleStampComponent extends StatelessWidget {
  const SampleStampComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return StampComponent(
      isActive: true,
      image: Container(
        color: const Color(0xFFBCD7FF),
        child: const Center(
          child: Icon(
            Icons.local_florist_outlined,
            color: Color(0xFF2D5ACB),
            size: 28,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
