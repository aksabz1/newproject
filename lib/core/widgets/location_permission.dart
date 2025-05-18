import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/location_provider.dart';
import 'package:salons/core/utils/color_manager.dart';

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.asset('assets/images/location_permission.png'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                'فعال کردن موقعیت مکانی',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                'لطفا برای استفاده از این اپلیکیشن، موقعیت مکانی خود را فعال کنید',
                textDirection: TextDirection.rtl,
              ),
            ),
            const Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<LocationProvider>(context, listen: false)
                        .getLocation();
                    if (Provider.of<LocationProvider>(context, listen: false)
                        .permissionDenied) {
                      AppSettings.openAppSettings();
                      Provider.of<LocationProvider>(context, listen: false)
                          .getLocation();
                    }
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.perpel,
                    minimumSize: Size(170.w, 40.w),
                  ),
                  child: const Center(
                    child: Text(
                      'فعالسازی',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.white,
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    minimumSize: Size(150.w, 40.w),
                  ),
                  child: const Center(
                    child: Text(
                      'الان نه',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
      minChildSize: .4,
      initialChildSize: 1,
    );
  }
}
