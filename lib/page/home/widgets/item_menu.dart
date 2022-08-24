import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String text;

  const ItemMenu({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: .7, color: Colors.white54),
              top: BorderSide(width: .7, color: Colors.white54))),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              size: 16,
            )
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
