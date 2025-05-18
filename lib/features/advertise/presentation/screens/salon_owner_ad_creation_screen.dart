import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/advertise/presentation/provider/booking_or_create_ad_provider.dart';
import 'package:salons/features/appointment_management/presentation/provider/appointment_provider.dart';
import 'package:salons/features/advertise/presentation/provider/salon_form_validation_provider.dart';
import 'package:salons/features/advertise/presentation/provider/salon_owner_image_provider.dart';
import 'package:salons/features/advertise/presentation/provider/seat_price_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/widgets/address_form_field_widget.dart';
import 'package:salons/core/widgets/calendar.dart';
import 'package:salons/core/widgets/image_dialog.dart';
import 'package:salons/core/widgets/reservation_card.dart';
import 'package:salons/core/widgets/seat_selection_guide.dart';
import 'package:salons/core/utils/validation_manager.dart';

class SalonOwnerAdCreationScreen extends StatelessWidget {
  SalonOwnerAdCreationScreen({super.key});
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ایجاد آگهی',
          style: getBoldStyle16(color: ColorManager.black),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Gap(15.w),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: Provider.of<SalonFormValidationProvider>(context,
                                  listen: false)
                              .salonNameKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: SizedBox(
                              width: 200.w,
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                    isDense: true,
                                  ),
                                  onTapOutside: (event) =>
                                      FocusScope.of(context).unfocus(),
                                  validator: Validator.apply(
                                    context,
                                    [
                                      RequiredValidation(),
                                      MinLengthValidation(),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        const Text(':اسم سالن'),
                      ],
                    ),
                  ),
                  const AddressFormField(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Form(
                              key: Provider.of<SalonFormValidationProvider>(
                                      context,
                                      listen: false)
                                  .salonPhoneKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(11),
                                ],
                                validator: Validator.apply(
                                  context,
                                  [
                                    RequiredValidation(),
                                  ],
                                ),
                                decoration: const InputDecoration(
                                  hintText: '',
                                  hintTextDirection: TextDirection.ltr,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(':شماره تلفن سالن'),
                      ],
                    ),
                  ),
                  const SeatPrice(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(':توضیحات'),
                        const SizedBox(height: 12),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            maxLines: 5,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(':آپلود عکس‌های سالن'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' حداکثر می‌توانید 4 عکس برای نمایش آپلود کنید.',
                          textDirection: TextDirection.rtl,
                          style: getLightStyle(color: ColorManager.darkGrey),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                    child: Consumer<SalonOwnerImageProvider>(
                      builder: (context, imageProvider, _) {
                        return SizedBox(
                          height: .1.sh,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            itemCount: 4,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(left: 8.0.w),
                              child: GestureDetector(
                                onTap: () {
                                  if (imageProvider.image[index] == null) {
                                    Provider.of<SalonOwnerImageProvider>(
                                            context,
                                            listen: false)
                                        .pickImage(index);
                                  }
                                  if (imageProvider.image[index] != null) {
                                    showDialog(
                                      context: context,
                                      builder: (_) => ImageDialog(
                                        imageFile: imageProvider.image[index]!,
                                      ),
                                    );
                                  }
                                },
                                onLongPress: () {
                                  Provider.of<SalonOwnerImageProvider>(context,
                                          listen: false)
                                      .removeImage(index);
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 10,
                                      top: 5,
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          color: ColorManager.perpel,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: .2.sw,
                                      width: .2.sw,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: ColorManager.perpel,
                                        ),
                                      ),
                                      child: imageProvider.image[index] == null
                                          ? const Icon(
                                              Icons.attach_file,
                                              color: ColorManager.perpel,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.file(
                                                imageProvider.image[index]!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'توضیحات',
                              style: getBoldStyle14(color: ColorManager.perpel),
                            )),
                        const Text(':تقویم‌ زمان‌های خالی صندلی‌ها'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              toolbarHeight: 25,
              flexibleSpace: Directionality(
                textDirection: TextDirection.rtl,
                child: TabBar(
                  tabs: [
                    Text('صندلی 1'),
                    Text('صندلی 2'),
                  ],
                ),
              ),
            )
          ],
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('ساعت کاری:'),
                              Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  Container(
                                    width: 250.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          ColorManager.perpel.withOpacity(0.3),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 250,
                                    height: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 120,
                                            child:
                                                ListWheelScrollView.useDelegate(
                                              onSelectedItemChanged: (index) {
                                                Provider.of<AppointmentProvider>(
                                                        context,
                                                        listen: false)
                                                    .setLowerUnavilableTime(
                                                        index);
                                              },
                                              physics:
                                                  const FixedExtentScrollPhysics(),
                                              itemExtent: 50,
                                              perspective: 0.003,
                                              diameterRatio: 1.25,
                                              childDelegate:
                                                  ListWheelChildBuilderDelegate(
                                                childCount: 15,
                                                builder: (context, index) =>
                                                    Center(
                                                  child:
                                                      Text('${index + 8}:00'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'تا',
                                          style: getBoldStyle16(
                                              color: ColorManager.black),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 120,
                                            child:
                                                ListWheelScrollView.useDelegate(
                                              onSelectedItemChanged: (index) {
                                                Provider.of<AppointmentProvider>(
                                                        context,
                                                        listen: false)
                                                    .setUpperUnavilableTime(
                                                        index);
                                              },
                                              physics:
                                                  const FixedExtentScrollPhysics(),
                                              itemExtent: 50,
                                              perspective: 0.003,
                                              diameterRatio: 1.25,
                                              childDelegate:
                                                  ListWheelChildBuilderDelegate(
                                                childCount: 15,
                                                builder: (context, index) =>
                                                    Center(
                                                  child:
                                                      Text('${index + 8}:00'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(10),
                          const Calendar(),
                          const SeatSelectionGuide(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.w, horizontal: 30.w),
                            child: const ReservationItems(),
                          ),
                          const Gap(20)
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('ساعت کاری:'),
                              Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  Container(
                                    width: 250.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          ColorManager.perpel.withOpacity(0.3),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 250,
                                    height: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 120,
                                            child:
                                                ListWheelScrollView.useDelegate(
                                              onSelectedItemChanged: (index) {
                                                Provider.of<AppointmentProvider>(
                                                        context,
                                                        listen: false)
                                                    .setLowerUnavilableTime(
                                                        index);
                                              },
                                              physics:
                                                  const FixedExtentScrollPhysics(),
                                              itemExtent: 50,
                                              perspective: 0.003,
                                              diameterRatio: 1.25,
                                              childDelegate:
                                                  ListWheelChildBuilderDelegate(
                                                childCount: 15,
                                                builder: (context, index) =>
                                                    Center(
                                                  child:
                                                      Text('${index + 8}:00'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'تا',
                                          style: getBoldStyle16(
                                              color: ColorManager.black),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 80,
                                            child:
                                                ListWheelScrollView.useDelegate(
                                              physics:
                                                  const FixedExtentScrollPhysics(),
                                              itemExtent: 35,
                                              perspective: 0.005,
                                              diameterRatio: 1.25,
                                              childDelegate:
                                                  ListWheelChildBuilderDelegate(
                                                childCount: 15,
                                                builder: (context, index) =>
                                                    Center(
                                                  child:
                                                      Text('${index + 8}:00'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(10),
                          const Calendar(),
                          const SeatSelectionGuide(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.w, horizontal: 30.w),
                            child: const ReservationItems(),
                          ),
                          const Gap(20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        var provider = Provider.of<SalonFormValidationProvider>(
                            context,
                            listen: false);
                        if (provider.salonNameKey.currentState!.validate() &&
                            provider.salonPhoneKey.currentState!.validate() &&
                            provider.seatPriceKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                          Provider.of<BookingOrCreateAdProvider>(context,
                                  listen: false)
                              .selectedIndex = null;
                        }
                        scrollController.animateTo(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.perpel,
                        minimumSize: Size(200.w, 40.w),
                      ),
                      child: Text(
                        'ثبت',
                        style: getBoldStyle(
                          color: ColorManager.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SeatPrice extends StatelessWidget {
  const SeatPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: 200.w,
                child: Consumer<SeatPriceProvider>(
                    builder: (context, provider, _) {
                  return Form(
                    key: Provider.of<SalonFormValidationProvider>(context,
                            listen: false)
                        .seatPriceKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      controller: provider.priceController,
                      inputFormatters: [DigitInputFormat()],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        Provider.of<SeatPriceProvider>(context, listen: false)
                            .changePriceValue(value);
                      },
                      validator: Validator.apply(
                        context,
                        [
                          RequiredValidation(),
                        ],
                      ),
                      decoration: const InputDecoration(
                        hintText: '40',
                        isDense: true,
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    ),
                  );
                }),
              ),
              Consumer<SeatPriceProvider>(
                builder: (context, provider, _) {
                  return Text(
                    DigitToWord.toWord(
                      provider.priceController.text,
                      StrType.NumWord,
                      isMoney: true,
                      separator: ",",
                    ),
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      color: ColorManager.grey,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(':قيمت اجاره ساعتی صندلی'),
          ),
        ],
      ),
    );
  }
}
