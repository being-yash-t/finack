import 'package:finack/src/core/dependency_injection.dart';
import 'package:finack/src/presentation/routing/router.gr.dart';
import 'package:finack/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  try {
    initDI();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final appRouter = AppRouter();
    runApp(
      MaterialApp.router(
        title: 'Finack',
        theme: lightTheme,
        darkTheme: darkTheme,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  } catch (ex) {
    debugPrint("Failed to initialize app");
    debugPrint(ex.toString());
    runApp(const FailedToInitApp());
  }
}

class FailedToInitApp extends StatelessWidget {
  const FailedToInitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Failed to initialize app, contact developer");
  }
}
