import 'package:get/get.dart';
import 'package:mobile_chat/models/chat_model.dart';
import 'package:mobile_chat/models/messages_model.dart';

class MessagesController extends GetxController {

    var messagesData = <MessagesModel>[].obs;
    var isLoading = true.obs;


  fetchMessages(userId) {
    isLoading.value = true;
    List<MessagesModel> messages = [
      MessagesModel(
          id: 1,
          recipientFirstName: "John",
          recipientLastName: "Peter",
          receiverId: 4,
          publishedAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          chats: [
            ChatModel(
              author: Author(
                  createdAt: DateTime.now(),
                  id: 1,
                  firstName: "John Peter",
                  updatedAt: DateTime.now(),
                  lastName: "John"),
              message: "Hello John how are you",
              timestamp: DateTime.now(),
            ),
            ChatModel(
              author: Author(
                  createdAt: DateTime.now(),
                  id: 4,
                  firstName: "John Peter",
                  updatedAt: DateTime.now(),
                  lastName: "John"),
              message: "I'm good what about you ?",
              timestamp: DateTime.now(),
            ),
              ChatModel(
              author: Author(
                  createdAt: DateTime.now(),
                  id: 1,
                  firstName: "John Peter",
                  updatedAt: DateTime.now(),
                  lastName: "John"),
              message: "fine too",
              timestamp: DateTime.now(),
            )
          ]),
      MessagesModel(
          id: 2,
          recipientFirstName: "John",
          recipientLastName: "Peter",
          receiverId: 4,
          publishedAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          chats: [
            ChatModel(
              author: Author(
                  createdAt: DateTime.now(),
                  id: 1,
                  firstName: "John Peter",
                  updatedAt: DateTime.now(),
                  lastName: "John"),
              message: "Hi I;m fine what about you",
              timestamp: DateTime.now(),
            )
          ]),
      MessagesModel(
          id: 3,
          recipientFirstName: "John",
          recipientLastName: "Peter",
          receiverId: 4,
          publishedAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          chats: [
            ChatModel(
              author: Author(
                  createdAt: DateTime.now(),
                  id: 1,
                  firstName: "John Peter",
                  updatedAt: DateTime.now(),
                  lastName: "John"),
              message: "Hello John how are you",
              timestamp: DateTime.now(),
            )
          ]),
      MessagesModel(
          id: 4,
          recipientFirstName: "John",
          recipientLastName: "Peter",
          receiverId: 4,
          publishedAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          chats: [
            ChatModel(
              author: Author(
                  createdAt: DateTime.now(),
                  id: 1,
                  firstName: "John Peter",
                  updatedAt: DateTime.now(),
                  lastName: "John"),
              message: "Hello John how are you",
              timestamp: DateTime.now(),
            )
          ]),
      MessagesModel(
          id: 5,
          recipientFirstName: "John",
          recipientLastName: "Peter",
          receiverId: 4,
          publishedAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          chats: [
            ChatModel(
              author: Author(
                  createdAt: DateTime.now(),
                  id: 1,
                  firstName: "John Peter",
                  updatedAt: DateTime.now(),
                  lastName: "John"),
              message: "Hello John how are you",
              timestamp: DateTime.now(),
            )
          ])
    ];

    messagesData.value = messages;
    isLoading.value = false;
  }
}
