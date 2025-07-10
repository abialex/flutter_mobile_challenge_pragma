import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_base_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBasePage(bodyWidget: Text("home page"));
  }
}
