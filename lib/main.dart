//import 'package:boilerplate/helpers/notification_helper/notification_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'ui/screens/init_screen/init_screen.dart';

//import 'ui/screens/init_screen/init_screen.dart';

void main() async {
  /// Make sure this is called before initialising plugins.
  // WidgetsFlutterBinding.ensureInitialized();
  FlutterServicesBinding.ensureInitialized();

  // Status bar config
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  // Initialising the Hydrated Bloc storage.
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const InitScreen()),
    storage: storage,
  );
}
