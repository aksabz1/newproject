import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/advertise/presentation/provider/beautician_form_provider.dart';
import 'package:salons/features/business_management/presentation/provider/business_form_image_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/utils/styles_manager.dart';
import 'package:salons/core/widgets/address_form_field_widget.dart';
import 'package:salons/core/widgets/beautician_work_sample.dart';
import 'package:salons/core/widgets/eyelash_services.dart';
import 'package:salons/core/widgets/hair_services.dart';
import 'package:salons/core/widgets/image_dialog.dart';
import 'package:salons/core/widgets/national_code_field.dart';
import 'package:salons/core/widgets/skin_services.dart';
import 'package:salons/core/utils/validation_manager.dart';
class BeauticianEditInfoFormFields extends StatelessWidget {
  const BeauticianEditInfoFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const NationalCodeField(),
        const Gap(5),
        _getDropDownButton(
          context,
          ['دارم', 'ندارم'],
          ':وضعیت سالن',
          250.w,
        ),
        const Gap(5),
        Consumer<BeauticianFormProvider>(
          builder: (context, beauticainFormProvider, _) {
            {
              return Visibility(
                visible: beauticainFormProvider.hasSalon,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Form(
                            key: Provider.of<BeauticianFormProvider>(context,
                                    listen: false)
                                .salonNameKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: SizedBox(
                                width: 250.w,
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(':اسم سالن'),
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250.w,
                            child: Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 11) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(11),
                                ],
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 14),
                                decoration: InputDecoration(
                                  hintText: '021*******',
                                  labelStyle: getLightStyle(
                                      color: ColorManager.grey, fontSize: 16),
                                  hintStyle: getBoldStyle(
                                    color: ColorManager.lightGrey,
                                    fontSize: 14,
                                  ),
                                  isDense: true,
                                ),
                                validator: Validator.apply(
                                  context,
                                  [
                                    RequiredValidation(),
                                  ],
                                ),
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                              ),
                            ),
                          ),
                          const Text('تلفن سالن'),
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
        const Gap(10),
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
        const Gap(10),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.w),
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
                          Provider.of<BusinessFormImageProvider>(context,
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
                                    borderRadius: BorderRadius.circular(20),
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
        const Gap(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: const Text('ویرایش خدمات', textDirection: TextDirection.rtl),
        ),
        const Gap(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            'مو',
            textDirection: TextDirection.rtl,
            style: getBoldStyle16(color: ColorManager.perpel),
          ),
        ),
        const HairServices(),
        const BeauticianWorkSamples(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
          child: const Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            'پوست',
            textDirection: TextDirection.rtl,
            style: getBoldStyle16(color: ColorManager.perpel),
          ),
        ),
        const SkinServices(),
        const BeauticianWorkSamples(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
          child: const Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            'مژه',
            textDirection: TextDirection.rtl,
            style: getBoldStyle16(color: ColorManager.perpel),
          ),
        ),
        const EyelashServices(),
        const BeauticianWorkSamples(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
          child: const Divider(),
        ),
      ],
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

