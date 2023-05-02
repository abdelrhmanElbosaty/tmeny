class ApiMiniUser {
  ApiMiniUser({
    required this.id,
    required this.userName,
    this.profilePicture,
  });

  final String id;
  final String userName;
  final String? profilePicture;

  factory ApiMiniUser.fromJson(Map<String, dynamic> json) => ApiMiniUser(
        id: json["id"],
        userName: json["userName"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "profilePicture": profilePicture,
      };

  // MiniUser map() {
  //   return MiniUser(id, userName, profilePicture ?? "");
  // }
}
