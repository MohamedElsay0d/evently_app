class UserModel {
  final String id;
  final String name;
  final String email;
  final List<String> favoriteEventsId;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favoriteEventsId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'favoriteEventsId': favoriteEventsId,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) :
     this(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      favoriteEventsId: json['favoriteEventsId'],
    );
}
