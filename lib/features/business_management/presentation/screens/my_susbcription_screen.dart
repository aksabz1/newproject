import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/select_role_provider.dart';
import 'package:salons/features/business_management/presentation/provider/my_subscription_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/widgets/modal.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<MySubscriptionProvider>(
          builder: (context, provider, _) {
            return provider.isSubscriptionActive
                ? const ActiveSubscription()
                : const NoSubscription();
          },
        ),
      ),
    );
  }
}

class ActiveSubscription extends StatelessWidget {
  const ActiveSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<SelectRoleProvider>(
          builder: (context, provider, child) {
            return Center(
              child: Container(
                height: .4.sh,
                width: .8.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      provider.selectedIndex == 0
                          ? 'assets/images/subscription1.png'
                          : 'assets/images/subscription2.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
        const Gap(5),
        const Text('اشتراک فعال'),
        const Gap(30),
        Container(
          height: .25.sh,
          width: 0.8.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: ColorManager.perpel,
                blurRadius: 2,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: const Center(
            child: Column(
              children: [
                Gap(10),
                Text(
                  'اشتراک 3 آگهی به مدت 3 ماه',
                ),
                Gap(15),
                Text(
                  '2 آگهی باقی مانده',
                  textDirection: TextDirection.rtl,
                ),
                Gap(5),
                Text(
                  '20 روز باقی مانده',
                  textDirection: TextDirection.rtl,
                ),
                Spacer(),
                Text(
                  'تاریخ فعالسازی: 1403/03/14',
                  textDirection: TextDirection.rtl,
                ),
                Gap(10),
              ],
            ),
          ),
        ),
        const Gap(30),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  showCustomModalBottomSheet(
                      context: context,
                      builder: (context) => const SelectSubscription());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.w, 45.w),
                  backgroundColor: ColorManager.white,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: ColorManager.perpel,
                    ),
                  ),
                ),
                child: const Text(
                  'خرید اشتراک جدید',
                  style: TextStyle(
                    color: ColorManager.perpel,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showCustomModalBottomSheet(
                    context: context,
                    builder: (context) => const PurchaseSubscription(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.w, 45.w),
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: ColorManager.perpel,
                    ),
                  ),
                ),
                child: const Text(
                  'تمدید اشتراک',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectSubscription extends StatelessWidget {
  const SelectSubscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectRoleProvider>(builder: (context, roleProvider, _) {
      return CustomModal(
        height: .8.sh,
        child: Column(
          children: [
            const Gap(10),
            Center(
              child: Container(
                height: .25.sh,
                width: .6.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      roleProvider.selectedIndex == 0
                          ? 'assets/images/subscription1.png'
                          : 'assets/images/subscription2.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Text(roleProvider.selectedIndex == 0
                ? 'آرایشگر عزیز'
                : 'سالن دار عزیز'),
            const Gap(20),
            const Text('لطفا اشتراک مورد نظر خود را انتخاب کنید'),
            const Gap(20),
            SizedBox(
              height: .3.sh,
              child: ListView.builder(
                  itemCount: roleProvider.selectedIndex == 0 ? 3 : 2,
                  itemBuilder: (context, index) {
                    if (roleProvider.selectedIndex == 0) {
                      return BeauticianSubscriptionItem(
                        selectedIndex: index,
                      );
                    } else {
                      return SalonOwnerSubscriptionItem(
                        selectedIndex: index,
                      );
                    }
                  }),
            ),
            const Gap(20),
            Consumer<MySubscriptionProvider>(builder: (context, provider, _) {
              return ElevatedButton(
                onPressed: provider.selectedIndex == null
                    ? null
                    : () {
                        Navigator.pop(context);
                        showCustomModalBottomSheet(
                          context: context,
                          builder: (context) => const PurchaseSubscription(),
                        );
                        context
                            .read<MySubscriptionProvider>()
                            .setSelectedIndex(null);
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.w, 45.w),
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: ColorManager.perpel,
                    ),
                  ),
                ),
                child: const Text(
                  'خرید اشتراک',
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}

class BeauticianSubscriptionItem extends StatelessWidget {
  BeauticianSubscriptionItem({super.key, required this.selectedIndex});
  int selectedIndex;
  final List<int> prices = [60, 120, 700];
  final List<int> adCount = [3, 7, 12];
  final List<int> duration = [3, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Consumer<MySubscriptionProvider>(
        builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ChoiceChip(
          label: SizedBox(
            height: .065.sh,
            width: .75.sw,
            child: Center(
              child: selectedIndex == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${prices[selectedIndex]} هزار تومان',
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              '${adCount[selectedIndex]} آگهی ',
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              'اشتراک ${duration[selectedIndex]} ماهه',
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15.0,
                            top: 5,
                          ),
                          child: Text(
                            '+5 ساعت نمایش بیشتر در تبلیغات محلی',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 10,
                              color: provider.selectedIndex == selectedIndex
                                  ? ColorManager.white
                                  : ColorManager.grey,
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${prices[selectedIndex]} هزار تومان',
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          '${adCount[selectedIndex]} آگهی ',
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          'اشتراک ${duration[selectedIndex]} ماهه',
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
            ),
          ),
          selected: provider.selectedIndex == selectedIndex,
          showCheckmark: false,
          selectedColor: ColorManager.perpel,
          onSelected: (value) {
            provider.setSelectedIndex(selectedIndex);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: ColorManager.perpel,
              width: 0.5,
            ),
          ),
          shadowColor: ColorManager.perpel,
        ),
      );
    });
  }
}

class SalonOwnerSubscriptionItem extends StatelessWidget {
  SalonOwnerSubscriptionItem({super.key, required this.selectedIndex});
  int selectedIndex;
  final List<int> prices = [100, 150];
  final List<int> adCount = [1, 2];
  final List<int> duration = [1, 1];

  @override
  Widget build(BuildContext context) {
    return Consumer<MySubscriptionProvider>(
        builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ChoiceChip(
          label: SizedBox(
            height: .065.sh,
            width: .75.sw,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${prices[selectedIndex]} هزار تومان',
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    '${adCount[selectedIndex]} آگهی ',
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    'اشتراک ${duration[selectedIndex]} ماهه',
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ),
          selected: provider.selectedIndex == selectedIndex,
          showCheckmark: false,
          selectedColor: ColorManager.perpel,
          onSelected: (value) {
            provider.setSelectedIndex(selectedIndex);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: ColorManager.perpel,
              width: 0.5,
            ),
          ),
          shadowColor: ColorManager.perpel,
        ),
      );
    });
  }
}

class PurchaseSubscription extends StatelessWidget {
  const PurchaseSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectRoleProvider>(builder: (context, roleProvider, _) {
      return CustomModal(
        height: .8.sh,
        child: Column(
          children: [
            const Gap(10),
            Center(
              child: Container(
                height: .25.sh,
                width: .6.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      roleProvider.selectedIndex == 0
                          ? 'assets/images/subscription1.png'
                          : 'assets/images/subscription2.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Text(roleProvider.selectedIndex == 0
                ? 'آرایشگر عزیز'
                : 'سالن دار عزیز'),
            const Gap(20),
            const Text('آیا از انتخاب خود مطمئن هستید؟'),
            const Gap(20),
            Container(
              height: .25.sh,
              width: 0.8.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: ColorManager.perpel,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(15),
                    Text(
                      'اشتراک برای 3 آگهی به مدت 3 ماه',
                      textDirection: TextDirection.rtl,
                    ),
                    Gap(10),
                    Text(
                      'به مبلغ 60 هزار تومان',
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150.w, 45.w),
                      backgroundColor: ColorManager.white,
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: ColorManager.perpel,
                        ),
                      ),
                    ),
                    child: const Text(
                      'انصراف',
                      style: TextStyle(
                        color: ColorManager.perpel,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150.w, 45.w),
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: ColorManager.perpel,
                        ),
                      ),
                    ),
                    child: const Text(
                      'تایید',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class NoSubscription extends StatelessWidget {
  const NoSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<SelectRoleProvider>(
          builder: (context, provider, child) {
            return Center(
              child: Container(
                height: .4.sh,
                width: .8.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      provider.selectedIndex == 0
                          ? 'assets/images/subscription1.png'
                          : 'assets/images/subscription2.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
        const Gap(30),
        const Text('هیچ اشتراک فعالی ندارید'),
        const Gap(50),
        ElevatedButton(
          onPressed: () {
            context.read<MySubscriptionProvider>().setIsSubscriptionActive();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(180.w, 45.w),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: ColorManager.perpel,
              ),
            ),
          ),
          child: const Text(
            'خرید اشتراک',
            style: TextStyle(
              color: ColorManager.perpel,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
