import 'package:anonymessage/components/tile.dart';
import 'package:anonymessage/pages/reply_screen.dart';
import 'package:anonymessage/utils/message_list_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/shimmer_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MessageListController messageListController =
      Get.put(MessageListController());

  @override
  void initState() {
    super.initState();
    messageListController.getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/sc-bg.png', fit: BoxFit.fill),
          Obx(
            () {
              return messageListController.loading.value
                  ? ListView.builder(
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            debugPrint('a');
                          },
                          child: ShimmerTile(
                            text: 'g',
                            index: index,
                          ),
                        );
                      },
                    )
                  : (messageListController.messageList.isNotEmpty)
                      ? ListView.builder(
                          itemCount: messageListController.messageList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                  () => ReplyScreen(
                                    text: messageListController
                                        .messageList[index].message
                                        .toString(),
                                    fileDate: messageListController
                                        .messageList[index].dateTime
                                        .toString(),
                                  ),
                                );
                              },
                              child: Tile(
                                text: messageListController
                                    .messageList[index].message,
                                dateTime: messageListController
                                    .messageList[index].dateTime,
                                index: index,
                              ),
                            );
                          },
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "You have no messages, Copy the link and share it using social media and wait till you get message",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }
}
