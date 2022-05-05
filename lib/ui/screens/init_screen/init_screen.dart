import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

import '../../../localization/l10n.dart';
import '../../../logic/blocs/internet_bloc/internet_bloc.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../routes/routes.dart';
import '../../../themes/app_theme.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc(
            connectivity: Connectivity(),
          ),
        ),

        //
        BlocProvider<UserMetadataBloc>(
          create: (context) => UserMetadataBloc(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                // Light Theme
                theme: AppTheme.lightTheme,

                // Routing:
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: SPLASH_ROUTE,

                // Localisation:
                supportedLocales: L10n.all,
                locale: Locale(
                  context.select(
                    (UserMetadataBloc bloc) {
                      return bloc.state.metadata?.selectedLanguage ?? 'en';
                    },
                  ),
                ),
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
              );
            },
          );
        },
      ),
    );
  }
}
