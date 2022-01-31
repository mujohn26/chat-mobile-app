import 'package:flutter/material.dart';
import 'package:mobile_chat/models/messages_model.dart';
import 'package:mobile_chat/screens/chat_screen/chat_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessagesModel message;

  void redirectToChat(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen(messages: message)),
    );
  }

  // checkGroupNameLength(groupName) {
  //   if (groupName.length > 16) {
  //     return groupName.substring(0,
  //             groupName.length - timeago.format(messages.publishedAt).length) +
  //         '...';
  //   } else {
  //     return groupName;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => redirectToChat(context),
      child: Container(
          height: 100,
          margin:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
          color:  Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => {},
                      child: const SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.people_outline_outlined,
                              color: Color(0xffcbcad9))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 5),
                  child: Container(
                    width: size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${message.recipientFirstName + ' ' + message.recipientLastName}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontFamily: "Muli",
                                    fontSize: 16,
                                    color: Color(0xff00b7bc))),
                            Text(timeago.format(message.publishedAt),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontFamily: "Muli", fontSize: 12)),
                          ],
                        ),
                        Flexible(
                          child: Text(message.chats.last.message,
                              style: const TextStyle(
                                  fontFamily: "Muli", fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
