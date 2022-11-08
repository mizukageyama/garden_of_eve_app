class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String profileImage;
  bool isAdmin;
  // DateTime createdAt;
  // DateTime modifiedAt;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
    required this.isAdmin,
    // required this.createdAt,
    // required this.modifiedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        email: json['email'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        profileImage: json['profile_img'] ?? '',
        isAdmin: json['is_admin'] == 1,
        // createdAt: DateTime.parse(json['created_at']),
        // modifiedAt: DateTime.parse(json['modified_at']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "profile_img": profileImage,
        "is_admin": isAdmin ? 1 : 0,
      };

  @override
  String toString() {
    return 'User Info (First Name: $firstName, Last Name: $lastName, Email: $email';
    //'\n Create: $createdAt; Modified: $modifiedAt';
  }
}
