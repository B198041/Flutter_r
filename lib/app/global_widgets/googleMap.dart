import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/location.dart';

class ETGoogleMap extends GetView<GoogleLocation> {
  const ETGoogleMap({
    Key? key,
    required this.onMapCreated,
    this.myLocationEnabled = true,
    this.markedCoordinates,
    this.onTap,
  }) : super(key: key);

  final void Function(GoogleMapController) onMapCreated;
  final LatLng? markedCoordinates;
  final bool myLocationEnabled;
  final Function(LatLng)? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoogleLocation>(
      init: GoogleLocation(),
      builder: (location) {
        if (location.currentLocation == null) {
          return const Center(child: CircularProgressIndicator());
        }

        LatLng initialPosition = LatLng(
          51.5074,
          0.1278,
        );

        bool hasMarker = markedCoordinates != null &&
            (markedCoordinates!.latitude != 0 ||
                markedCoordinates!.longitude != 0);

        return GoogleMap(
          mapType: MapType.normal,
          onMapCreated: onMapCreated,
          compassEnabled: true,
          myLocationEnabled: myLocationEnabled,
          myLocationButtonEnabled: myLocationEnabled,
          markers: hasMarker
              ? {
                  Marker(
                    markerId: const MarkerId('marker'),
                    position: markedCoordinates!,
                  ),
                }
              : {},
          initialCameraPosition: CameraPosition(
            target: hasMarker ? markedCoordinates! : initialPosition,
            zoom: 15,
          ),
          onTap: onTap,
        );
      },
    );
  }
}
