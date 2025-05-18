import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/core/utils/color_manager.dart';
import 'package:salons/core/widgets/modal.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('سالن اورانوس'),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          Center(
            child: IconButton(
                icon:
                    const Icon(Icons.more_vert, color: Colors.black, size: 28),
                onPressed: () {
                  showCustomModalBottomSheet(
                    context: context,
                    builder: (context) => CustomModal(
                      height: .22.sh,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                        ),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'گزارش تخلف',
                                ),
                                Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: Icon(Icons.stop_circle_outlined,
                                      color: ColorManager.black, size: 25),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'مسدود کردن',
                                ),
                                Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: Icon(Icons.dangerous_outlined,
                                      color: ColorManager.black, size: 25),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 2),
                ),
                const BubbleSpecialThree(
                  text: 'سلام وقتتون بخیر',
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  seen: true,
                  isSender: false,
                ),
                const BubbleSpecialThree(
                  text:
                      'میخواستم بپرسم سالن دارای سشوار موتور قوی برای استفاده رایگان هست یا خیر ؟ ',
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  seen: true,
                  isSender: false,
                ),
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 1),
                ),
                BubbleNormalImage(
                  id: 'id001',
                  image: _image(),
                  color: ColorManager.perpel,
                  tail: true,
                  seen: true,
                  delivered: true,
                ),
                const BubbleSpecialThree(
                  text:
                      'سلام وقت شما بخیر بله داریم. مدل بوش ۶۲۰۰  اوکی هستین؟',
                  color: ColorManager.perpel,
                  tail: true,
                  seen: true,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const BubbleSpecialThree(
                  text:
                      'خیلی خوبه من چند تا کار کراتینه دارم. میخوام صندلی رزرو کنم   ',
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  seen: true,
                  isSender: false,
                ),
                const BubbleSpecialThree(
                  text:
                      ' ما یک صندلی مختص کراتینه داریم . میتونید اون رو رزرو کنید .روی تقویم توی آگهی بزنید ',
                  color: ColorManager.perpel,
                  tail: true,
                  seen: true,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                DateChip(
                  date: now,
                ),
                const BubbleSpecialThree(
                  sent: true,
                  text: 'آره دیدم یه تقویم هست الان امتحان میکنم ',
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  isSender: false,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          MessageBar(
            onSend: (_) => FocusScope.of(context).unfocus(),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: const Icon(
                    Icons.camera_alt,
                    color: ColorManager.perpel,
                    size: 24,
                  ),
                  onTap: () {
                    showCustomModalBottomSheet(
                      context: context,
                      builder: (context) => CustomModal(
                          height: .27.sh,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 40,
                              ),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(9.0),
                                        child: Text(
                                          'ارسال',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'عکس از دوربین',
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(9.0),
                                        child: Icon(Icons.camera_alt,
                                            color: ColorManager.black,
                                            size: 25),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'عکس از گالری',
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(9.0),
                                        child: Icon(Icons.image_rounded,
                                            color: ColorManager.black,
                                            size: 25),
                                      ),
                                    ],
                                  ),
                                ],
                              ))),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _image() {
    return Container(
        constraints: const BoxConstraints(
          minHeight: 20.0,
          minWidth: 20.0,
        ),
        child: Image.asset(
          'assets/images/seshwar.jpg',
        ));
  }
}
