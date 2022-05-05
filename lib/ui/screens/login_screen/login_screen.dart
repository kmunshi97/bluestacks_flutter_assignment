import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/image_path_constants.dart';
import '../../../logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../routes/routes.dart';
import '../../widgets/form_widgets/bst_button.dart';
import '../../widgets/form_widgets/bst_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  //
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: Center(
            child: BlocBuilder<UserMetadataBloc, UserMetadataState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            SizedBox(height: 8.h),

                            // App logo image
                            Image.asset(
                              APP_LOGO_IMAGE,
                              width: 48.w,
                              height: 16.h,
                            ),

                            SizedBox(height: 8.h),

                            // Username TextField
                            BSTTextFieldWidget(
                              headerText:
                                  AppLocalizations.of(context)?.username ?? "",
                              hintText:
                                  AppLocalizations.of(context)?.username ?? "",
                              prefixIcon: const Icon(Icons.person_outline),
                              textEditingController: _usernameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)
                                          ?.required ??
                                      '';
                                } else if (value.length < 3) {
                                  return AppLocalizations.of(context)
                                          ?.userless ??
                                      '';
                                } else if (value.length > 11) {
                                  return AppLocalizations.of(context)
                                          ?.usermore ??
                                      '';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 2.h),

                            // Password TextField
                            BSTTextFieldWidget(
                              headerText:
                                  AppLocalizations.of(context)?.password ?? "",
                              hintText:
                                  AppLocalizations.of(context)?.password ?? "",
                              prefixIcon: const Icon(Icons.lock_outline),
                              textEditingController: _passwordController,
                              isObsureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)
                                          ?.required ??
                                      '';
                                } else if (value.length < 3) {
                                  return AppLocalizations.of(context)
                                          ?.passless ??
                                      '';
                                } else if (value.length > 11) {
                                  return AppLocalizations.of(context)
                                          ?.passmore ??
                                      '';
                                }
                                return null;
                              },
                            ),

                            // Forgot Password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                    AppLocalizations.of(context)?.unable ?? ''),
                                TextButton(
                                  onPressed: () =>
                                      _handleForgotPasswordOnPressed(context),
                                  child: Text(
                                      AppLocalizations.of(context)?.forgot ??
                                          ''),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            //
                            Expanded(
                              child: SecondaryButton(
                                buttonText:
                                    AppLocalizations.of(context)?.signup ?? '',
                                handleOnPressed: () =>
                                    _handleSignupOnPressed(context),
                              ),
                            ),

                            //
                            Expanded(
                              child: PrimaryButton(
                                buttonText:
                                    AppLocalizations.of(context)?.login ?? '',
                                handleOnPressed: () =>
                                    _handleLoginPressed(context),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 6.h),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handleLoginPressed(BuildContext context) {
    // Guard clause to disable the login.
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)?.snack1 ?? ''),
        ),
      );
      return;
    }

    // Login code:
    // User 1: 9898989898 / password123
    // User 2: 9876543210 / password123
    if ((_usernameController.text.trim() == '9898989898' ||
            _usernameController.text.trim() == '9876543210') &&
        _passwordController.text.trim() == 'password123') {
      //
      // Hydrate the user details to the Hydrated Bloc
      BlocProvider.of<UserMetadataBloc>(context).add(
        UserMetadataChangeEvent(
          metadata: UserMetadataModel(
            username: _usernameController.text.trim(),
          ),
        ),
      );

      // Navigate to the Home Screen.
      Navigator.of(context).pushReplacementNamed(HOME_ROUTE);

      // Login Successful.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "${AppLocalizations.of(context)?.welcome ?? "Welcome"} ${_usernameController.text.trim()}."),
        ),
      );

      return;
    }

    // If the username and password do not match.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)?.snack2 ?? ""),
      ),
    );
  }

  void _handleSignupOnPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)?.snack3 ?? ""),
      ),
    );
    return;
  }

  void _handleForgotPasswordOnPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)?.snack3 ?? ""),
      ),
    );
    return;
  }
}
