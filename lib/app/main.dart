// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/app.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/keyboard_visibility_listener/keyboard_visibility_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/lifecycle_listener/app_lifecycle_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/cubit/can_pop_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getItApp = GetIt.instance;

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getItApp<KeyboardVisibilityCubit>()),
        BlocProvider(create: (context) => getItApp<AppLifecycleCubit>()),
        BlocProvider(create: (context) => CatBloc()),
        BlocProvider(create: (context) => getItApp<CanPopCubit>()),
      ],
      child: const SafeArea(child: App()),
    );
  }
}
