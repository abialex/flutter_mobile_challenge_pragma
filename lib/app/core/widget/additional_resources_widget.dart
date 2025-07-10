import 'package:flutter/material.dart';

class AdditionalResourcesWidget extends StatelessWidget {
  const AdditionalResourcesWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.subtitle,
    required this.title,
    required this.url,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final String url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
