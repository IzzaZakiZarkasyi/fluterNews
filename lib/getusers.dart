class GetUsers {
  int id;
  String name;
  String email;
  String phoneNumber;

  GetUsers(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber});

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone']);
  }
}
