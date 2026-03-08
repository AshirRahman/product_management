import 'package:flutter/material.dart';

class ProductInfoTag extends StatelessWidget {

  final String title;

  const ProductInfoTag({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        color: const Color(0xff6F6CD9),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}