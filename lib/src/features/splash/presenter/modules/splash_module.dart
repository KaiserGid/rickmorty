import 'package:rickmorty/src/app_module.dart';
import 'package:rickmorty/src/features/splash/controllers/splash_controller_i.dart';
import 'package:rickmorty/src/features/splash/controllers/splash_controller_impl.dart';

splashSetup() {
  getIt.registerFactory<SplashController>(() => SplashControllerImp());
}
