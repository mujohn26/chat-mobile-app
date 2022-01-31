import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_chat/controllers/messages_controller.dart';
import 'package:mobile_chat/widgets/circular_progress_indicator.dart';
import 'package:mobile_chat/widgets/message_widget.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen(
      {Key? key})
      : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final messagesController = Get.put(MessagesController());

  @override
  void initState() {
    setMessages();
    super.initState();
  }

  var messageList;
  var messages;

  void setMessages() {
    messagesController.fetchMessages(4);
    setState(() {
      messageList = messagesController.messagesData;
    });
  }

  final onTapped = () {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chats',
          style: TextStyle(
              fontFamily: "Muli", fontSize: 25, color: Color(0xff7b7890)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<MessagesController>(builder: (controller) {
              if (controller.isLoading.isTrue) {
                return const CenteredProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: controller.messagesData.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                      return MessageWidget(
                          message: controller.messagesData[index],
                         );
            
                  },
                );
              }
              ;
            }),
          ),
        ],
      ),
    );
  }
}
