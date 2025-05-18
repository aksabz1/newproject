import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/location_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/widgets/location_confirm.dart';
import 'package:salons/core/widgets/location_permission.dart';
import 'package:salons/core/widgets/modal.dart';

class LocationIdentifier extends StatelessWidget {
  LocationIdentifier({super.key});
  final MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(10.w),
        const Text('ايجاد آدرس'),
        Gap(25.w),
        Consumer<LocationProvider>(builder: (context, locationProvider, child) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              SizedBox(
                height: .72.sh,
                child: FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    onTap: (tapPosition, point) {
                      Provider.of<LocationProvider>(context, listen: false)
                          .setTappedLocation(point);
                    },
                    initialCenter: LatLng(
                      locationProvider.currentLocation != null
                          ? locationProvider.currentLocation!.latitude!
                          : 35.6892523214,
                      locationProvider.currentLocation != null
                          ? locationProvider.currentLocation!.longitude!
                          : 51.3896004323,
                    ),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/rezam80/clv9pkq7c00qr01occqut134o/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmV6YW04MCIsImEiOiJjbHY5cGMxejMwamdvMnFwOHVlNmF4Ync2In0._kNuetjoEUdAQW92uiUucQ',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      rotate: true,
                      markers: [
                        if (locationProvider.tappedLocation == null) ...[
                          Marker(
                            point: LatLng(
                              locationProvider.currentLocation != null
                                  ? locationProvider.currentLocation!.latitude!
                                  : 35.6892523214,
                              locationProvider.currentLocation != null
                                  ? locationProvider.currentLocation!.longitude!
                                  : 51.3896004323,
                            ),
                            child: const Icon(
                              Icons.location_on,
                              size: 40,
                              color: Colors.purple,
                            ),
                          )
                        ],
                        if (locationProvider.tappedLocation != null) ...[
                          Marker(
                            point: LatLng(
                                locationProvider.tappedLocation!.latitude,
                                locationProvider.tappedLocation!.longitude),
                            child: const Icon(
                              Icons.location_on,
                              size: 40,
                              color: Colors.purple,
                            ),
                          )
                        ],
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  if (locationProvider.currentLocation == null) {
                    showBottomSheet(
                      context: context,
                      builder: (context) => const LocationPermission(),
                    );
                  }

                  Provider.of<LocationProvider>(context, listen: false)
                      .setTappedLocation(null);
                  mapController.move(
                    LatLng(
                      locationProvider.currentLocation != null
                          ? locationProvider.currentLocation!.latitude!
                          : 35.6892523214,
                      locationProvider.currentLocation != null
                          ? locationProvider.currentLocation!.longitude!
                          : 51.3896004323,
                    ),
                    15,
                  );
                },
                icon: const Icon(
                  Icons.my_location,
                  color: Colors.purple,
                  size: 45,
                ),
              ),
              Positioned(
                right: 100.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (locationProvider.tappedLocation == null) {
                      Provider.of<LocationProvider>(context, listen: false)
                          .getAddressFromLatLng(
                        LatLng(
                          locationProvider.currentLocation!.latitude!,
                          locationProvider.currentLocation!.latitude!,
                        ),
                      );
                    } else {
                      Provider.of<LocationProvider>(context, listen: false)
                          .getAddressFromLatLng(
                              locationProvider.tappedLocation!);
                    }

                    debugPrint(locationProvider.address);
                    showCustomModalBottomSheet(
                        context: context,
                        builder: (_) => CustomModal(
                              height: .8.sh,
                              child: const LocationConfirm(),
                            ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.perpel,
                    minimumSize: Size(200.w, 40.w),
                  ),
                  child: const Text(
                    'انتخاب',
                  ),
                ),
              )
            ],
          );
        }),
      ],
    );
  }
}
