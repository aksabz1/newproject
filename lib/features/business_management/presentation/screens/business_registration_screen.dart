import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/business_management/presentation/provider/business_form_image_provider.dart';
import 'package:salons/core/provider/select_role_provider.dart';
import 'package:salons/features/business_management/presentation/provider/selective_service_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/widgets/address_form_field_widget.dart';
import 'package:salons/core/widgets/beautician_info_widget.dart';
import 'package:salons/core/widgets/beautician_work_sample.dart';
import 'package:salons/core/widgets/custom_textfield.dart';
import 'package:salons/core/widgets/image_dialog.dart';
import 'package:salons/core/widgets/national_code_field.dart';

class BusinessRegistrationScreen extends StatefulWidget {
  const BusinessRegistrationScreen({super.key});

  @override
  State<BusinessRegistrationScreen> createState() =>
      _BusinessRegistrationScreenState();
}

class _BusinessRegistrationScreenState
    extends State<BusinessRegistrationScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ServiceListProvider()),
        ChangeNotifierProvider(
            create: (context) => BusinessFormImageProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: const Text(
            'ثبت کسب و کار',
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: Consumer<SelectRoleProvider>(
          builder: (context, provider, _) {
            if (provider.selectedIndex == 1) {
              return PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(15),
                        const CustomTextField(
                          title: ':نام و نام خانوادگی',
                          hintText: '',
                          textDecoration: TextDirection.rtl,
                        ),
                        const CustomTextField(
                          title: ':اسم سالن',
                          hintText: '',
                          textDecoration: TextDirection.rtl,
                        ),
                        const CustomTextField(
                          title: ':شماره تلفن سالن',
                          hintText: '',
                          textDecoration: TextDirection.rtl,
                        ),
                        const AddressFormField(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '(حداکثر 300 کاراکتر)',
                                    style: getLightStyle(
                                        color: ColorManager.darkGrey),
                                  ),
                                  const Text(':توضیحات'),
                                ],
                              ),
                              Gap(15.w),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(300),
                                  ],
                                  maxLength: 300,
                                  maxLines: 4,
                                  decoration: const InputDecoration(
                                    hintText: '',
                                    hintTextDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                                style:
                                    getLightStyle(color: ColorManager.darkGrey),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 30.w),
                          child: Consumer<BusinessFormImageProvider>(
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
                                        Provider.of<BusinessFormImageProvider>(
                                                context,
                                                listen: false)
                                            .pickImage(index);
                                      }
                                      if (imageProvider.image[index] != null) {
                                        showDialog(
                                          context: context,
                                          builder: (_) => ImageDialog(
                                            imageFile:
                                                imageProvider.image[index]!,
                                          ),
                                        );
                                      }
                                    },
                                    onLongPress: () {
                                      Provider.of<BusinessFormImageProvider>(
                                              context,
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: ColorManager.perpel,
                                            ),
                                          ),
                                          child: imageProvider.image[index] ==
                                                  null
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
                          }),
                        ),
                        Gap(15.w),
                        const NationalCodeField(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.w, horizontal: 30.w),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _pageController.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(200.w, 45.w),
                                ),
                                child: Text(
                                  'مرحله بعد',
                                  style: getBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Gap(15),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.w, horizontal: 30.w),
                          child: const Text(': خدمات سالن'),
                        ),
                        ServicesWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 30.w),
                          child: Consumer<ServiceListProvider>(
                            builder: (context, provider, _) {
                              return Row(
                                children: [
                                  TextButton(
                                    onPressed:
                                        provider._serviceProviders.length < 4
                                            ? () {
                                                provider.addServiceProvider();
                                              }
                                            : null,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'افزودن دسته بندی',
                                          style: getBoldStyle14(
                                            color: provider._serviceProviders
                                                        .length ==
                                                    4
                                                ? ColorManager.grey
                                                : ColorManager.perpel,
                                          ),
                                        ),
                                        const Gap(10),
                                        Icon(
                                          Icons.add_circle_outline_rounded,
                                          color: provider._serviceProviders
                                                      .length ==
                                                  4
                                              ? ColorManager.grey
                                              : ColorManager.perpel,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.w, horizontal: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _pageController.animateToPage(0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(170.w, 45.w),
                                  backgroundColor: ColorManager.white,
                                  surfaceTintColor: Colors.white,
                                ),
                                child: Text(
                                  'مرحله قبل',
                                  style: getBoldStyle(
                                    color: ColorManager.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(170.w, 45.w),
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
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Gap(15.w),
                  const CustomTextField(
                    title: ':نام و نام خانوادگی',
                    hintText: '',
                    textDecoration: TextDirection.rtl,
                  ),
                  ServicesWidget(),
                  Gap(5.w),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                    child: Consumer<ServiceListProvider>(
                        builder: (context, provider, _) {
                      return Row(
                        children: [
                          TextButton(
                            onPressed: provider._serviceProviders.length < 4
                                ? () {
                                    provider.addServiceProvider();
                                  }
                                : null,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'افزودن دسته بندی',
                                  style: getBoldStyle14(
                                    color:
                                        provider._serviceProviders.length == 4
                                            ? ColorManager.grey
                                            : ColorManager.perpel,
                                  ),
                                ),
                                const Gap(10),
                                Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: provider._serviceProviders.length == 4
                                      ? ColorManager.grey
                                      : ColorManager.perpel,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  const AddressFormField(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '(حداکثر 300 کاراکتر)',
                              style:
                                  getLightStyle(color: ColorManager.darkGrey),
                            ),
                            const Text(':توضیحات'),
                          ],
                        ),
                        Gap(15.w),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(300),
                            ],
                            maxLength: 300,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              hintText: '',
                              hintTextDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                    child: Consumer<BusinessFormImageProvider>(
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
                                  Provider.of<BusinessFormImageProvider>(
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
                                Provider.of<BusinessFormImageProvider>(context,
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
                    }),
                  ),
                  Gap(15.w),
                  const NationalCodeField(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.w, horizontal: 30.w),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(200.w, 45.w),
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ServicesWidget extends StatelessWidget {
  ServicesWidget({super.key});
  final items = ['خدمات مو', 'خدمات ناخن', 'خدمات پوست', 'خدمات مژه'];

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceListProvider>(
      builder: (context, serviceListProvider, _) {
        return Wrap(
          children: List.generate(
            serviceListProvider.serviceProviders.length,
            (index) => ChangeNotifierProvider<SelectiveServiceProvider>.value(
              value: serviceListProvider.serviceProviders[index],
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
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
                                var provider = Provider.of<ServiceListProvider>(
                                        context,
                                        listen: false)
                                    .serviceProviders[index];
                                if (value == 'خدمات مو') {
                                  provider.setChips(
                                    [
                                      ServiceChip(name: 'کوتاهی مو'),
                                      ServiceChip(name: 'رنگ مو '),
                                      ServiceChip(name: 'شنیون مو'),
                                      ServiceChip(name: 'بافت مو'),
                                      ServiceChip(name: 'براشینگ مو'),
                                      ServiceChip(name: 'احیا مو'),
                                      ServiceChip(name: 'اکستنشن مو'),
                                      ServiceChip(name: 'کراتین مو'),
                                    ],
                                  );
                                }
                                if (value == 'خدمات پوست') {
                                  provider.setChips(
                                    [
                                      ServiceChip(name: 'فیشیال'),
                                      ServiceChip(name: 'پاکسازی'),
                                      ServiceChip(name: 'میکاپ'),
                                      ServiceChip(name: 'اپیلاسیون'),
                                      ServiceChip(name: 'تتو بدن'),
                                    ],
                                  );
                                }
                                if (value == 'خدمات ناخن') {
                                  provider.setChips(
                                    [
                                      ServiceChip(name: 'مانیکور'),
                                      ServiceChip(name: 'پدیکور'),
                                      ServiceChip(name: 'ژلیش'),
                                      ServiceChip(name: 'لمینت ناخن'),
                                    ],
                                  );
                                }
                                if (value == 'خدمات مژه') {
                                  provider.setChips(
                                    [
                                      ServiceChip(name: 'اکستنشن مژه'),
                                      ServiceChip(name: 'لیفت مژه'),
                                      ServiceChip(name: 'لمینت مژه'),
                                      ServiceChip(name: 'بن مژه'),
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
                    child: Consumer<SelectiveServiceProvider>(
                      builder: (context, selectiveServiceProvider, _) {
                        return Wrap(
                          spacing: 10.w,
                          children: List.generate(
                            selectiveServiceProvider.chips.length,
                            (chipIndex) => ChoiceChip(
                              label: SizedBox(
                                height: 25.w,
                                width: 80.w,
                                child: Center(
                                  child: Text(
                                    selectiveServiceProvider
                                        .chips[chipIndex].name,
                                    style: getBoldStyle14(
                                        color: selectiveServiceProvider
                                                .chips[chipIndex].isSelected
                                            ? ColorManager.white
                                            : ColorManager.perpel),
                                  ),
                                ),
                              ),
                              showCheckmark: false,
                              selectedColor: ColorManager.perpel,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  side: BorderSide(
                                    color: ColorManager.perpel,
                                  )),
                              onSelected: (value) {
                                selectiveServiceProvider.selectChip(
                                    chipIndex, value);
                              },
                              selected: selectiveServiceProvider
                                  .chips[chipIndex].isSelected,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.0.w, vertical: 10.w),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('مشخصات آرایشگر'),
                      ],
                    ),
                  ),
                  const BeauticianInfoWidget(),
                  const BeauticianWorkSamples(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: ColorManager.perpel,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ServiceListProvider extends ChangeNotifier {
  final List<SelectiveServiceProvider> _serviceProviders = [
    SelectiveServiceProvider([])
  ];
  List<SelectiveServiceProvider> get serviceProviders => _serviceProviders;
  void addServiceProvider() {
    _serviceProviders.add(
      SelectiveServiceProvider([]),
    );
    notifyListeners();
  }
}
