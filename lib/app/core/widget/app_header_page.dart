import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_image.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_colors.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/cubit/mode_theme_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_const_text.dart';

class AppHeaderPage extends StatelessWidget {
  const AppHeaderPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            context.watch<ModeThemeCubit>().state
                ? AppConstImage.background_header_dark
                : AppConstImage.background_header,
          ),
          fit: BoxFit.cover,
        ),
        color: AppConstColors.f3efff,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: AppConstColors.black.withAlpha((0.45 * 255).round()), blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          AppConstText.largeText(text: title, color: AppConstColors.white, fontWeight: FontWeight.bold),
          Expanded(
            child: InkWell(
              onTap: () {
                context.read<ModeThemeCubit>().toggle();
              },
              child: Icon(context.watch<ModeThemeCubit>().state ? Icons.light_mode_rounded : Icons.dark_mode),
            ),
          ),
        ],
      ),
    );
  }
}
