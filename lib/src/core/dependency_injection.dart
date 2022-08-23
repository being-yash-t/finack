import 'package:finack/src/core/services/auth_service.dart';
import 'package:finack/src/core/services/firestore_service.dart';
import 'package:finack/src/presentation/routing/router.gr.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;
T findInstance<T extends Object>() => _getIt<T>();

void initDI() {
  _getIt.registerSingleton<FirestoreHelper>(FirestoreHelper());
  _getIt.registerSingleton<AuthService>(AuthService());
  _getIt.registerSingleton<AppRouter>(AppRouter());
}
