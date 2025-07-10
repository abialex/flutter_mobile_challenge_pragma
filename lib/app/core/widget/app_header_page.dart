import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_image.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/cubit/can_pop_cubit.dart';
import 'package:go_router/go_router.dart';

class AppHeaderPage extends StatelessWidget {
  const AppHeaderPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppConstImage.background_header), fit: BoxFit.cover),
        color: Color(0xFFF3EFFF),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.45), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child:
                  context.watch<CanPopCubit>().state
                      ? CircleAvatar(
                        radius: 15,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(Icons.arrow_left_rounded, size: 25),
                        ),
                      )
                      : SizedBox.shrink(),
            ),
          ), // Spacer to center the title
          Text(title, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          Expanded(child: Container()), // Spacer to center the title
          // Icon(Icons.search, color: Colors.black, size: 28),
        ],
      ),
    );
  }
}
