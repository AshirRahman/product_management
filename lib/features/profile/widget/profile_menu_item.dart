import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {

  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Icon(icon, color: color),

      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),

      onTap: onTap,
    );
  }
}