class ChatModel {
  final String message;
  final DateTime? timestamp;
  var author;

  ChatModel({this.message = '', required this.author, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      message: json["message"] ?? '',
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.parse(DateTime.now().toString()),
      author: json['author'] != null ? Author.fromJson(json['author']) : '');

  Map<String, dynamic> toJson() => {
        "message": message,
        "timestamp": timestamp!.toIso8601String(),
        "author": author,
      };
}

class Author {
  final int? id;
  final String username;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String firstName;
  final String lastName;
  final String profileImage;

  Author(
      {this.id,
      this.username = '',
      this.email = '',
      DateTime? createdAt,
      DateTime? updatedAt,
      this.firstName = "",
      this.lastName = "",
      this.profileImage = ''})
      : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      firstName: json['first_name'],
      lastName: json['last_name'],
      profileImage: json['profile_image'] != null
          ? json['profile_image']['formats']['small']['url']
          : '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "first_name": firstName,
        "last_name": lastName,
        "profile_image": profileImage,
      };
}
