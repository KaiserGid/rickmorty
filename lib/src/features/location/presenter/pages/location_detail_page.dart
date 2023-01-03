import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/location/domain/entities/location_entity.dart';
import 'package:rickmorty/src/features/shared/widgets/appbar_widget.dart';

class LocationDetailPage extends StatelessWidget {
  final LocationEntity location;

  const LocationDetailPage({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustomWidget(
        appTitle: location.name,
      ),
      body: Column(
        children: [Text(location.name)],
      ),
    );
  }
}
