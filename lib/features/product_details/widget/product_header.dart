import 'package:course_online/core/common/widgets/app_image.dart';
import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget {
  final String image;

  const ProductHeader({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AppImage(
          path: image,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
