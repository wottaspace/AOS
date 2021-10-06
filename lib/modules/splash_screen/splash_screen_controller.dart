import 'package:okito/okito.dart';
import 'package:arcopen_enquirer/config/routes/k_router.dart';
import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/constants/app_constants.dart';
import 'package:arcopen_enquirer/utils/helpers/k_storage.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';

class SplashScreenController extends OkitoController with ToastMixin {
  SplashScreenController._internal();
  static final SplashScreenController _singleton = SplashScreenController._internal();

  factory SplashScreenController() {
    return _singleton;
  }

  bool initDataFailed = false;

  void initialize() {
    Future.delayed(Duration(seconds: 2)).then((value) async {
      if (KStorage().read(key: AppConstants.firstAppOpeningKey) == true) {
        KStorage().write(key: AppConstants.firstAppOpeningKey, value: true);
        KRouter().push(KRoutes.stepperRoute, replace: true);
        return;
      }
      KRouter().push(KRoutes.loginRoute, replace: true);
    });
  }
}
