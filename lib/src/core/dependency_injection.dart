import 'package:finack/src/core/services/auth_service.dart';
import 'package:finack/src/core/services/firestore_service.dart';
import 'package:get/instance_manager.dart';

S findInstance<S>({String? tag}) => Get.find<S>(tag: tag);

initDI() {
  Get.put(() => FirestoreHelper(), permanent: true);
  Get.put(() => AuthService(), permanent: true);
}
