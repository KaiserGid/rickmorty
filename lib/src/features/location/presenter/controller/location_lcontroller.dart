import 'package:flutter/cupertino.dart';

import '../../../../app_module.dart';
import '../store/location_store.dart';

class LocationController {
  init() async {
    try {
      await getIt<LocationStore>().getLocations().then((value) => Future.delayed(const Duration(seconds: 3)));
    } catch (e) {
      debugPrintStack();
    }
  }
}
