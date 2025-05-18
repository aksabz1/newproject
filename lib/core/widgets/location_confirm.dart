import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/location_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/widgets/location_identifier.dart';
import 'package:salons/core/widgets/modal.dart';

class LocationConfirm extends StatelessWidget {
  const LocationConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Gap(10.w),
            const Center(child: Text('ايجاد آدرس')),
            Gap(25.w),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  height: .25.sh,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: locationProvider.tappedLocation ??
                          LatLng(
                            locationProvider.currentLocation != null
                                ? locationProvider.currentLocation!.latitude!
                                : 35.6892523214,
                            locationProvider.currentLocation != null
                                ? locationProvider.currentLocation!.longitude!
                                : 51.3896004323,
                          ),
                      initialZoom: 17,
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
                                    ? locationProvider
                                        .currentLocation!.latitude!
                                    : 35.6892523214,
                                locationProvider.currentLocation != null
                                    ? locationProvider
                                        .currentLocation!.longitude!
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
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      showCustomModalBottomSheet(
                        context: context,
                        builder: (_) => CustomModal(
                          height: .8.sh,
                          child: LocationIdentifier(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 150.w,
                      height: 30.w,
                      child: Center(
                        child: Text(
                          'ویرایش موقعیت',
                          style: getMediumStyle(
                              color: ColorManager.grey, fontSize: 12.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(':نشانی'),
                  Gap(5.w),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      controller: locationProvider.addressController,
                      textInputAction: TextInputAction.next,
                      textDirection: TextDirection.rtl,
                      maxLines: 3,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    ),
                  ),
                  Text(
                    '  جهت اطمینان نشانی را چک کرده و در صورت مغایرت آن ر اصلاح کنید.',
                    textDirection: TextDirection.rtl,
                    style: getLightStyle(
                      color: ColorManager.grey,
                      fontSize: 12.sp,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(':جزئیات'),
                  Gap(5.w),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      controller: locationProvider.detailAddressController,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'مثال: پلاک 10 - واحد 10',
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    ),
                  ),
                ],
              ),
            ),
            Gap(60.w),
            Row(
              children: [
                Gap(10.w),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Provider.of<LocationProvider>(context, listen: false)
                        .comleteAddress(
                      locationProvider.addressController.text,
                      locationProvider.detailAddressController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.perpel,
                    minimumSize: Size(200.w, 40.w),
                  ),
                  child: const Text(
                    'انتخاب',
                  ),
                ),
              ],
            ),
            Gap(5.w),
          ],
        );
      }),
    );
  }
}
