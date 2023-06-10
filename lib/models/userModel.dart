class UserModel {
  String id;
  String fullname;
  String email;
  String phone;
  String address;
  String password;

  UserModel(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.phone,
      required this.address,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      password: json['password'] as String,
    );
  }
  Map<String, dynamic> registerUser() {
    return {
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "address": address,
      "password": password,
    };
  }

  Map<String, dynamic> loginUser() {
    return {
      "email": email,
      "password": password,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id,
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "address": address,
      "password": password,
    };
  }
}
