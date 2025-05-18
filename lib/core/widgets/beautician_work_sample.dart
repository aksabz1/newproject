import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salons/features/business_management/presentation/provider/business_form_image_provider.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/widgets/image_dialog.dart';

class BeauticianWorkSamples extends StatelessWidget {
  const BeauticianWorkSamples({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.w),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(':عکس‌های نمونه کار'),
            ],
          ),
        ),
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
      ],
    );
  }
}
