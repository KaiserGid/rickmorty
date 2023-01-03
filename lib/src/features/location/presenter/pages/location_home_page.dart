import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/location/domain/entities/location_entity.dart';
import 'package:rickmorty/src/features/location/presenter/controller/location_lcontroller.dart';
import 'package:rickmorty/src/features/location/presenter/store/location_store.dart';
import 'package:rickmorty/src/features/shared/constants/colors.dart';
import 'package:rickmorty/src/features/shared/widgets/appbar_widget.dart';

import '../../../../app_module.dart';
import '../../../shared/widgets/logo_progress_indicator_widget.dart';

class LocationHomePage extends StatefulWidget {
  final LocationStore locationController;

  const LocationHomePage({
    Key? key,
    required this.locationController,
  }) : super(key: key);

  @override
  State<LocationHomePage> createState() => _LocationHomePageState();
}

class _LocationHomePageState extends State<LocationHomePage> {
  LocationStore get controller => widget.locationController;
  final LocationController _locationController = LocationController();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    getIt<LocationStore>().addListener(() {});
    _locationController.init();
    _scrollController = ScrollController();
    _scrollController.addListener(infinitScroll);
  }

  infinitScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      controller.getLocations();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustomWidget(appTitle: 'Locations'),
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: backGroundColor,
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Visibility(
          visible: controller.locations.isEmpty,
          replacement: ListView.separated(
            controller: _scrollController,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
            ),
            itemCount: controller.locations.length,
            itemBuilder: (context, index) {
              LocationEntity location = controller.locations[index];
              return LocationListItemWidget(location: location, idLocation: index + 1);
            },
          ),
          child: const LogoProgressIndicator(),
        ),
      ),
    );
  }
}

class LocationListItemWidget extends StatelessWidget {
  const LocationListItemWidget({
    Key? key,
    required this.location,
    required this.idLocation,
  }) : super(key: key);

  final LocationEntity location;
  final int idLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 08),
      color: backGroundColor,
      height: 64,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(idLocation.toString(), style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(width: 50),
          Expanded(child: Text(location.name, style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.clip)),
        ],
      ),
    );
  }
}
