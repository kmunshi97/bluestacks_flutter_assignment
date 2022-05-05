import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../routes/route_constants.dart';
import 'widgets/drawer_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BSTDrawerWidget extends StatelessWidget {
  const BSTDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return drawerWidget(context);
  }

  Widget drawerWidget(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(36),
        bottomRight: Radius.circular(36),
      ),
      child: BlocBuilder<UserMetadataBloc, UserMetadataState>(
        builder: (context, state) {
          return Drawer(
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(0.0),
                    shrinkWrap: true,
                    children: [
                      Container(
                        height: 24.h,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //
                            CircleAvatar(
                              radius: 4.h,
                              backgroundColor: Colors.blue,
                              child: Text(
                                'KM',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            const SizedBox(height: 8),

                            //
                            Text(
                              'Kanishka Munshi',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 8),

                            //
                            Text(
                              'kmunshi.97@gmail.com',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),

                            const SizedBox(height: 4),

                            //
                            Text(
                              BlocProvider.of<UserMetadataBloc>(context)
                                      .state
                                      .metadata
                                      ?.username ??
                                  'Guest',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),

                      //
                      DrawerListTileWidget(
                        title: AppLocalizations.of(context)?.home ?? '',
                        trailingIcon: Icons.dashboard_outlined,
                        listTileOnTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            HOME_ROUTE,
                          );
                        },
                      )
                    ],
                  ),
                ),

                //

                DrawerListTileWidget(
                  title:
                      "${AppLocalizations.of(context)?.selectedlanguage ?? ''}: ${state.metadata!.selectedLanguage == 'ja' ? "Japanese" : "English"}",
                  trailingIcon: Icons.language,
                  listTileOnTap: () =>
                      _handleLocalisationOnPressed(state, context),
                ),

                //
                DrawerListTileWidget(
                  isLast: true,
                  title: BlocProvider.of<UserMetadataBloc>(context)
                                  .state
                                  .metadata
                                  ?.username ==
                              null ||
                          BlocProvider.of<UserMetadataBloc>(context)
                              .state
                              .metadata!
                              .username!
                              .isEmpty
                      ? 'Login'
                      : AppLocalizations.of(context)?.logout ?? '',
                  trailingIcon: Icons.logout,
                  listTileOnTap: () => _handleLogoutOnPressed(state, context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _handleLogoutOnPressed(UserMetadataState state, BuildContext context) {
    BlocProvider.of<UserMetadataBloc>(context).add(
      UserMetadataChangeEvent(
        metadata: UserMetadataModel(
          username: null,
          isLightTheme: true,
          selectedLanguage: state.metadata!.selectedLanguage,
        ),
      ),
    );

    Navigator.pushNamedAndRemoveUntil(
      context,
      LOGIN_ROUTE,
      ModalRoute.withName('/login'),
    );
  }

  _handleLocalisationOnPressed(UserMetadataState state, BuildContext context) {
    BlocProvider.of<UserMetadataBloc>(context).add(
      UserMetadataChangeEvent(
        metadata: UserMetadataModel(
          username: state.metadata?.username,
          isLightTheme: true,
          selectedLanguage:
              state.metadata!.selectedLanguage == "en" ? "ja" : "en",
        ),
      ),
    );
  }
}
