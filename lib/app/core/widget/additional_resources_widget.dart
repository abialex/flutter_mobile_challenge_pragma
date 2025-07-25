import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_colors.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_const_text.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_box.dart';
import 'package:go_router/go_router.dart';

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
      onTap: () {
        context.pushNamed(AppRoutes.catResourcesWebView.name, extra: {"url": url, "title": title});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Icon(icon, color: AppConstColors.white, size: 28),
            AppBox.w16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstText.mediumText(text: title, color: AppConstColors.white, fontWeight: FontWeight.bold),
                AppConstText.smallText(text: subtitle, color: AppConstColors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
