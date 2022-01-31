import 'package:cron/cron.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_chat/models/messages_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key,
      required this.messages,
      })
      : super(key: key);
  final MessagesModel messages;

  void addChat() {}
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController editingController = TextEditingController();
  // final chatController = Get.put(ChatController());
  final _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    // chatController.updateIssueId(widget.messages.id);
    // chatController.fetchChats();
    super.initState();
  }

  // void addChat() {
  //   if (editingController.text.isNotEmpty) {
  //     var currentTime = DateTime.now();
  //     Chat newChat = Chat(
  //       message: editingController.text,
  //       timestamp: currentTime,
  //       author: widget.user,
  //     );
  //     chatController.addChat(widget.messages.id, newChat);
  //     editingController.text = '';
  //     setState(() {});
  //   }
  // }

  void goBack() {
      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Cron().schedule(Schedule.parse('*/1 * * * * *'), () async {
      if (_controller.hasClients) {
        _controller.animateTo(
          _controller.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        );
      }
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xff7b7890)),
              onPressed: () => {goBack()},
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Column(
              children: [
                const Text(
                  'Chat',
                  style: TextStyle(color: Color(0xff7b7890), fontSize: 25.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(widget.messages.recipientFirstName,
                      style: const TextStyle(
                          color: Color(0xff7b7890), fontSize: 15.0)),
                )
              ],
            )),
        body: Stack(
          children: <Widget>[
            DelayedDisplay(
              delay: const Duration(milliseconds: 500),
              child: Container(
                margin: const EdgeInsets.only(bottom: 50.0),
                child: ListView.builder(
                    controller: _controller,
                    itemCount: widget.messages.chats.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    itemBuilder: (context, index) {
                      if (widget.messages.chats[index].author != '' &&
                          widget.messages.chats[index].message != '') {
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Align(
                                alignment: (4!=
                                        (widget.messages.chats[index].author != ''
                                            ? widget.messages.chats[index].author.id
                                            : 0)
                                    ? Alignment.topLeft
                                    : Alignment.topRight),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    4 !=
                                            (widget.messages.chats[index].author !=
                                                    ''
                                                ? widget.messages.chats[index].author.id
                                                : 0)
                                        ? Text(
                                            widget.messages.chats[index].author.firstName,
                                            style: const TextStyle(
                                                color: Color(0xff1e765f)),
                                          )
                                        : const Text(''),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: (4 !=
                                                      widget.messages.chats[index]
                                                          .author.id
                                                  ? const Color(0xffa3eef0)
                                                  : const Color(0xff55eac2)),
                                            ),
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              widget.messages.chats[index].message,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, right: 6),
                                          child: Text(
                                            DateFormat('dd/MM/yyyy, HH:mm')
                                                .format(widget.messages.chats[index]
                                                        .timestamp ??
                                                    DateTime.now())
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 7,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Color(0xff7b7890)),
                        controller: editingController,
                        decoration: const InputDecoration(
                          hintText: "Enter message",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                          fillColor: Color(0xfff5f6fa),
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // addChat();
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: const Color(0xff00b7bc),
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
