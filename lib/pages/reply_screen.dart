// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:anonymessage/utils/screenshot_controller.dart';
import 'package:anonymessage/components/blur_message_tile.dart';
import 'package:anonymessage/utils/reply_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ReplyScreen extends StatelessWidget {
  ReplyScreen({super.key, required this.text, required this.fileDate});
  String text;
  String fileDate;
  // var
  ScreenShotController screenShotController = Get.put(ScreenShotController());
  ReplyImageController replyImageController = Get.put(ReplyImageController());
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenShotController.screenshotController,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: IconButton(
                  onPressed: () {
                    replyImageController.getImage();
                  },
                  icon: const Icon(Icons.image)),
            )
          ],
        ),
        body: Center(
          child: Stack(
            children: [
              Obx(
                () {
                  return replyImageController.imagePath.value.isEmpty
                      ? Image.asset(
                          'assets/images/reply-bg.png',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: FileImage(
                            File(
                              replyImageController.imagePath.value.toString(),
                            ),
                          ),
                        );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: MessageTile(
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            child: Text(text),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Center(
                        child: MessageTile(
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            child: SizedBox(
                              width: 200,
                              child: TextFormField(
                                maxLines: null,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Write your Reply here ...",
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 20.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: SlideAction(
                      onSubmit: () async {
                        await screenShotController.captureScreenshot();
                      },
                      innerColor: const Color.fromARGB(169, 0, 0, 0),
                      borderRadius: 6,
                      outerColor: Colors.white.withOpacity(.6),
                      height: 50,
                      submittedIcon: InkWell(
                        onTap: () async {
                          await screenShotController.shareScreenshot();
                        },
                        child: Obx(() {
                          return screenShotController.loading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : const Icon(Icons.share);
                        }),
                      ),
                      child: const Text('Take a ScreenShot'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
