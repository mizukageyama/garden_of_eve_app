class User {
  int id;
  String email;
  String firstName;
  String lastName;
  // DateTime createdAt;
  // DateTime modifiedAt;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    // required this.createdAt,
    // required this.modifiedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        email: json['email'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        // createdAt: DateTime.parse(json['created_at']),
        // modifiedAt: DateTime.parse(json['modified_at']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      };

  @override
  String toString() {
    return 'User Info (First Name: $firstName, Last Name: $lastName, Email: $email';
    //'\n Create: $createdAt; Modified: $modifiedAt';
  }
}
