import 'package:flutter/material.dart';

class ItemMenuBottom extends StatelessWidget {
  final IconData icon;
  final String text;
  const ItemMenuBottom({Key? key, required this.icon, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Container(
        width: 81,
        decoration:BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white24),
        child: Column(
          children: [
            Icon(icon),
            Text(text)
          ],
        ),
      ),
    );
  }
}
