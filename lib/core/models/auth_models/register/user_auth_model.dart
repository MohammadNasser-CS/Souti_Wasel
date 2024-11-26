import 'dart:convert';

class UserRegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  UserRegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  UserRegisterModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return UserRegisterModel(
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      password: password ?? this.password,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'firstName': firstName});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'lastName': lastName});
    return result;
  }

  factory UserRegisterModel.fromMap(Map<String, dynamic> map) {
    return UserRegisterModel(
      firstName: map['firstName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      lastName: map['lastName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRegisterModel.fromJson(String source) =>
      UserRegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserRegisterModel(firstName: $firstName, lastName: $lastName, email: $email, password: $password,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRegisterModel &&
        other.firstName == firstName &&
        other.email == email &&
        other.password == password &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        lastName.hashCode;
  }
}
