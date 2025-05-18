import 'package:digit_to_persian_word/digit_to_persian_word.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/advertise/presentation/provider/beautician_form_provider.dart';
import 'package:salons/features/advertise/presentation/provider/booking_or_create_ad_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/widgets/address_form_field_widget.dart';
import 'package:salons/core/widgets/image_dialog.dart';
import 'package:salons/core/utils/validation_manager.dart';
import 'package:toastification/toastification.dart';

class BeauticianAdCreationScreen extends StatelessWidget {
  BeauticianAdCreationScreen({super.key});
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
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Gap(15.w),
            Gap(15.w),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: context.read<BeauticianFormProvider>().adNameKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        width: 200.w,
                        child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20)
                            ],
                            decoration: const InputDecoration(
                              hintText: 'مثلا نام و نام خانوادگی',
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
                  const Text(':عنوان آگهی'),
                ],
              ),
            ),
            ServiceCategory(),
            _getDropDownButton(
              context,
              ['دارم', 'ندارم'],
              ':وضعیت سالن',
              200.w,
            ),
            Consumer<BeauticianFormProvider>(
              builder: (context, beauticainFormProvider, _) {
                {
                  return Visibility(
                    visible: beauticainFormProvider.hasSalon,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Form(
                                key: Provider.of<BeauticianFormProvider>(
                                        context,
                                        listen: false)
                                    .salonNameKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                        const AddressFormField()
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(':توضیحات'),
                  Gap(15.w),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      maxLines: 5,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(':آپلود عکس‌های نمونه کار'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
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
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
              child: Consumer<BeauticianFormProvider>(
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
                            if (imageProvider.images[index] == null) {
                              Provider.of<BeauticianFormProvider>(context,
                                      listen: false)
                                  .pickImage(index);
                            }
                            if (imageProvider.images[index] != null) {
                              showDialog(
                                context: context,
                                builder: (_) => ImageDialog(
                                  imageFile: imageProvider.images[index]!,
                                ),
                              );
                            }
                          },
                          onLongPress: () {
                            Provider.of<BeauticianFormProvider>(context,
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
                                child: imageProvider.images[index] == null
                                    ? const Icon(
                                        Icons.attach_file,
                                        color: ColorManager.perpel,
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          imageProvider.images[index]!,
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
            Gap(30.w),
            _getSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Padding _getSubmitButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              var provider =
                  Provider.of<BeauticianFormProvider>(context, listen: false);
              bool isInvalidPrice = false;
              for (int i = 0; i < provider.selectedServices.length; i++) {
                if (provider.selectedServices[i].maxPrice == '' ||
                    provider.selectedServices[i].minPrice == '') {
                  isInvalidPrice = true;
                }
              }
              List imageList =
                  provider.images.where((element) => element == null).toList();
              if (provider.selectedServices.isEmpty) {
                toastification.show(
                  context: context,
                  type: ToastificationType.error,
                  style: ToastificationStyle.flat,
                  title: const Text('هیچ خدمتی انتخاب نشده است'),
                  description: const Text('لطفا حداقل یک خدمت را انتخاب کنید'),
                  alignment: Alignment.topLeft,
                  icon: const Icon(Icons.error),
                  direction: TextDirection.rtl,
                  backgroundColor: const Color(0xFFFFF4EE),
                  autoCloseDuration: const Duration(seconds: 4),
                );
              }
              if (imageList.length == 4) {
                toastification.show(
                  context: context,
                  type: ToastificationType.error,
                  style: ToastificationStyle.flat,
                  title: const Text('هیچ عکسی آپلود نشده است'),
                  description: const Text('لطفا حداقل یک عکس آپلود کنید'),
                  alignment: Alignment.topLeft,
                  icon: const Icon(Icons.image),
                  direction: TextDirection.rtl,
                  backgroundColor: const Color(0xFFFFF4EE),
                  autoCloseDuration: const Duration(seconds: 4),
                );
              }
              bool isSalonNameValid = provider.hasSalon
                  ? provider.salonNameKey.currentState!.validate()
                  : true;
              if (provider.adNameKey.currentState!.validate() &&
                  provider.selectedServices.isNotEmpty &&
                  !isInvalidPrice &&
                  isSalonNameValid &&
                  imageList.length < 4) {
                Provider.of<BookingOrCreateAdProvider>(context, listen: false)
                    .selectedIndex = null;
                Navigator.of(context).pop();
                provider.services.clear();
                provider.clearImages();
                provider.selectedServices.clear();
                provider.changeHasSalonFalse();
              }

              if (isInvalidPrice) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: ColorManager.perpel,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    content: Center(
                      child:
                          Text('هر خدمت باید حداقل و حداکثر قیمت داشته باشد'),
                    ),
                  ),
                );
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
    );
  }

  Padding _getDropDownButton(
      BuildContext context, List items, String title, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              width: width,
              height: 40.w,
              child: DropdownButtonFormField(
                items: items
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        alignment: Alignment.centerRight,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                hint: const Text('ندارم'),
                onChanged: (value) {
                  if (value == 'دارم') {
                    Provider.of<BeauticianFormProvider>(context, listen: false)
                        .changeHasSalonTrue();
                  } else if (value == 'ندارم') {
                    Provider.of<BeauticianFormProvider>(context, listen: false)
                        .changeHasSalonFalse();
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}

class ServiceCategory extends StatelessWidget {
  ServiceCategory({super.key});
  final items = ['خدمات مو', 'خدمات ناخن', 'خدمات پوست', 'خدمات مژه'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  width: 200.w,
                  height: 40.w,
                  child: DropdownButtonFormField(
                    items: items
                        .map((e) => DropdownMenuItem(
                              value: e,
                              alignment: Alignment.centerRight,
                              child: Text(e),
                            ))
                        .toList(),
                    hint: const Text('دسته بندی'),
                    onChanged: (value) {
                      var provider = Provider.of<BeauticianFormProvider>(
                          context,
                          listen: false);
                      if (value == 'خدمات مو') {
                        provider.selectedServices.clear();
                        provider.setServices(
                          [
                            Service(name: 'کوتاهی مو'),
                            Service(name: 'رنگ مو '),
                            Service(name: 'شنیون مو'),
                            Service(name: 'بافت مو'),
                            Service(name: 'براشینگ مو'),
                            Service(name: 'احیا مو'),
                            Service(name: 'اکستنشن مو'),
                            Service(name: 'کراتین مو'),
                          ],
                        );
                      }
                      if (value == 'خدمات پوست') {
                        provider.selectedServices.clear();
                        provider.setServices(
                          [
                            Service(name: 'فیشیال'),
                            Service(name: 'پاکسازی'),
                            Service(name: 'میکاپ'),
                            Service(name: 'اپیلاسیون'),
                            Service(name: 'تتو بدن'),
                          ],
                        );
                      }
                      if (value == 'خدمات ناخن') {
                        provider.selectedServices.clear();
                        provider.setServices(
                          [
                            Service(name: 'مانیکور'),
                            Service(name: 'پدیکور'),
                            Service(name: 'ژلیش'),
                            Service(name: 'لمینت ناخن'),
                          ],
                        );
                      }
                      if (value == 'خدمات مژه') {
                        provider.selectedServices.clear();
                        provider.setServices(
                          [
                            Service(name: 'اکستنشن مژه'),
                            Service(name: 'لیفت مژه'),
                            Service(name: 'لمینت مژه'),
                            Service(name: 'بن مژه'),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
              const Text(':دسته بندی'),
            ],
          ),
        ),
        Gap(15.w),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Consumer<BeauticianFormProvider>(
            builder: (context, provider, _) {
              return Wrap(
                spacing: 10.w,
                children: List.generate(
                  provider.services.length,
                  (chipIndex) => ChoiceChip(
                    label: SizedBox(
                      height: 25.w,
                      width: 80.w,
                      child: Center(
                        child: Text(
                          provider.services[chipIndex].name,
                          style: TextStyle(
                              color: provider.services[chipIndex].isSelected
                                  ? ColorManager.white
                                  : ColorManager.perpel),
                        ),
                      ),
                    ),
                    showCheckmark: false,
                    selectedColor: ColorManager.perpel,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: ColorManager.perpel,
                        )),
                    onSelected: (value) {
                      provider.selectServices(chipIndex, value);
                    },
                    selected: provider.services[chipIndex].isSelected,
                  ),
                ),
              );
            },
          ),
        ),
        Gap(20.w),
        Consumer<BeauticianFormProvider>(
          builder: (context, provider, _) {
            return Wrap(
              children: List.generate(
                provider.selectedServices.length,
                (index) => Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        provider.selectedServices[index].name,
                        style: getBoldStyle16(color: ColorManager.black),
                      ),
                      Gap(5.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('حداکثر'),
                              SizedBox(
                                height: 40.w,
                                width: 140.w,
                                child: TextField(
                                  inputFormatters: [
                                    DigitInputFormat(),
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    Provider.of<BeauticianFormProvider>(context,
                                            listen: false)
                                        .changeServiceMaxPrice(index, value);
                                  },
                                ),
                              ),
                              Consumer<BeauticianFormProvider>(
                                builder: (context, provider, _) {
                                  return Text(
                                    DigitToWord.toWord(
                                      provider.selectedServices[index].maxPrice,
                                      StrType.NumWord,
                                      isMoney: true,
                                      separator: ',',
                                    ),
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      color: ColorManager.grey,
                                      fontSize: 10,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('حداقل'),
                              SizedBox(
                                height: 40.w,
                                width: 140.w,
                                child: TextField(
                                  inputFormatters: [
                                    DigitInputFormat(),
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    Provider.of<BeauticianFormProvider>(context,
                                            listen: false)
                                        .changeServiceMinPrice(index, value);
                                  },
                                ),
                              ),
                              Consumer<BeauticianFormProvider>(
                                builder: (context, provider, _) {
                                  return Text(
                                    DigitToWord.toWord(
                                      provider.selectedServices[index].minPrice,
                                      StrType.NumWord,
                                      isMoney: true,
                                      separator: ',',
                                    ),
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      color: ColorManager.grey,
                                      fontSize: 10,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0.w),
                            child: const Text(':بازه قیمت'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
