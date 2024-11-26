import 'dart:convert';

class UserLoginModel {
  final String email;
  final String password;
  UserLoginModel({
    required this.email,
    required this.password,
  });

  UserLoginModel copyWith({
    String? email,
    String? password,
  }) {
    return UserLoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'email': email});
    result.addAll({'password': password});
    return result;
  }

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginModel.fromJson(String source) =>
      UserLoginModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserLoginModel(email: $email, password: $password,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserLoginModel &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return email.hashCode ^ password.hashCode;
  }
}
