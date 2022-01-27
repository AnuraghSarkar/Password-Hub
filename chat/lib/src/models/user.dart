class User {
  String get id => _id;
  late String _id;
  late String username;
  late String photoUrl;
  late bool active;
  late DateTime lastseen;

  User(
      {required String username,
      required String photoUrl,
      required String active,
      required String lastseen});

  toJson() => {
        'username': username,
        'photo_url': photoUrl,
        'active': active,
        'last_seen': lastseen,
      };
  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
        username: json['username'],
        photoUrl: json['photo_url'],
        active: json['active'],
        lastseen: json['last_seen']);

    user._id = json['_id'];

    return user;
  }
}
