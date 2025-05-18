import 'package:custom_rounded_rectangle_border/custom_rounded_rectangle_border.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:salons/core/utils/color_manager.dart';

class CustomModal extends StatelessWidget {
  final Widget child;
  final double height;
  // final Size size;

  const CustomModal({super.key, this.height = 100, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // persistentFooterAlignment: AlignmentDirectional.bottomEnd,
        backgroundColor: ColorManager.transparent,
        body: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Material(
              elevation: 45,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: ShapeDecoration(
                        shape: const CustomRoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13.0),
                              topRight: Radius.circular(13.0)),
                          leftSide: BorderSide(color: ColorManager.white),
                          topLeftCornerSide:
                              BorderSide(color: ColorManager.white),
                          rightSide: BorderSide(color: ColorManager.white),
                          topRightCornerSide:
                              BorderSide(color: ColorManager.white),
                          topSide: BorderSide(color: ColorManager.white),
                        ),
                        color: ColorManager.white.withOpacity(0.96)),
                    child: child,
                  ),
                  Container(
                      height: height * 0.1,
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                          top: height * 0.02, right: size.width * 0.03),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close,
                            color: ColorManager.highLightGrey, size: 25),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}

Future<T> showCustomModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool drag = true,
}) async {
  final result = await showCupertinoModalBottomSheet(
      context: context,
      builder: builder,
      backgroundColor: ColorManager.transparent,
      transitionBackgroundColor: ColorManager.transparent,
      barrierColor: ColorManager.transparent,
      enableDrag: drag,
      shadow: const BoxShadow(
        color: ColorManager.transparent,
      ));

  return result;
}
