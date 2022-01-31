import 'chat_model.dart';

class MessagesModel {
  final int? id;
  final String initialMessage;
  final String messageRoomName;
  final String recipientFirstName;
  final String recipientLastName;
  final int? receiverId;
  final DateTime publishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ChatModel> chats;

  MessagesModel({
    this.id,
    this.initialMessage = '',
    this.messageRoomName = '',
    this.recipientFirstName = "",
    this.recipientLastName = "",
    this.receiverId,
    DateTime? publishedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.chats = const [],
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now(),
        publishedAt = publishedAt ?? DateTime.now();

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        id: json["id"],
        initialMessage: json["initial_message"] ?? '',
        messageRoomName: json["message_room_name"] ?? '',
        recipientFirstName: json["recipient_first_name"] ?? '',
        recipientLastName: json["recipient_last_name"] ?? '',
        receiverId: json["receiver_id"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        chats: List<ChatModel>.from(
            json["chats"].map((x) => ChatModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": initialMessage,
        "message_room_name": messageRoomName,
        "recipient_first_name": recipientFirstName,
        "recipient_last_name": recipientLastName,
        "receiver_id": receiverId,
        "published_at": publishedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "chats": List<dynamic>.from(chats.map((x) => x.toJson())),
      };
}
