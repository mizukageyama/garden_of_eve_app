class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String address;
  String contactNumber;
  String createdAt;
  String modifiedAt;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.contactNumber,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        address: json['address'],
        contactNumber: json['contact_number'],
        createdAt: json['created_at'],
        modifiedAt: json['modified_at'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "contact_number": contactNumber,
      };

  @override
  String toString() {
    return 'User Info (First Name: $firstName, Last Name: $lastName, Email: $email, '
        'Address: $address, Contact Number: $contactNumber)\n Create: $createdAt; Modified: $modifiedAt';
  }
}
