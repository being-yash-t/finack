import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'src/core/services/auth_service.dart';
import 'src/core/dependency_injection.dart';
import 'src/presentation/failed_to_init_app.dart';
import 'src/presentation/routing/router.gr.dart';
import 'src/presentation/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    initDI();

    final appRouter = findInstance<AppRouter>();
    final auth = findInstance<AuthService>();
    runApp(
      MaterialApp.router(
        title: 'FinTrack',
        theme: lightTheme,
        darkTheme: darkTheme,
        routerDelegate: appRouter.delegate(
          initialDeepLink: auth.isSigned
              ? auth.hasPhoneVerified
                  ? '/dashboard'
                  : '/phoneVerification'
              : '/login',
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  } catch (ex) {
    debugPrint("Failed to initialize app");
    runApp(FailedToInitApp(message: ex.toString()));
  }
}
