import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/location_provider.dart';
import 'package:salons/core/widgets/location_identifier.dart';
import 'package:salons/core/widgets/modal.dart';

class AddressFormField extends StatelessWidget {
  const AddressFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showCustomModalBottomSheet(
                    context: context,
                    builder: (_) => CustomModal(
                      height: .8.sh,
                      child: LocationIdentifier(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 40.w,
                  width: 80.w,
                  child: Image.asset(
                    'assets/images/map 2.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Spacer(),
              const Text(':موقعیت مکانی'),
            ],
          ),
        ),
        Gap(10.w),
        Consumer<LocationProvider>(
          builder: (context, locationProvider, _) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(':نشانی'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(locationProvider.address ?? ''),
                    ],
                  ),
                  const Gap(15),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(':جزئیات'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(locationProvider.detailAddress ?? ''),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
