import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/image_path_constants.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSplashScreen(
          duration: 1000,
          splash: APP_LOGO_IMAGE,
          splashTransition: SplashTransition.sizeTransition,
          splashIconSize: 18.w,
          nextScreen:
              context.read<UserMetadataBloc>().state.metadata?.username ==
                          null ||
                      context
                          .read<UserMetadataBloc>()
                          .state
                          .metadata!
                          .username!
                          .isEmpty
                  ? LoginScreen()
                  : const HomeScreen(),
        ),
      ),
    );
  }
}
