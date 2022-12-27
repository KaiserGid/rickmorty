import 'splash_controller_i.dart';

class SplashControllerImp implements SplashController {
  @override
  String stateString = 'Carregando';

  @override
  Future init() async {
    // try {
    //   await getIt<Home>().getLocations().then((value) => Future.delayed(const Duration(seconds: 3)));
    // } catch (e) {
    //   debugPrintStack();
    // }

    await Future.delayed(const Duration(seconds: 5));
  }
}
