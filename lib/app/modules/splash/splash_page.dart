import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_gif.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_colors.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_const_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initFlow();
  }

  Future<void> _initFlow() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    context.pushNamed(AppRoutes.leading.name);
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;
    context.goNamed(AppRoutes.leading.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstColors.primaryPurple,
      body: Center(
        child: Column(
          spacing: 75,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppConstText.extraHugeText(text: 'Catbreeds', color: AppConstColors.white, fontWeight: FontWeight.bold),
            Image.asset(AppConstGif.waiting_cat, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
