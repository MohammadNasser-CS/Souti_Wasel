import 'dart:convert';

class StudentRegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  StudentRegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  StudentRegisterModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return StudentRegisterModel(
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

  factory StudentRegisterModel.fromMap(Map<String, dynamic> map) {
    return StudentRegisterModel(
      firstName: map['firstName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      lastName: map['lastName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentRegisterModel.fromJson(String source) =>
      StudentRegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentRegisterModel(firstName: $firstName, lastName: $lastName, email: $email, password: $password,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentRegisterModel &&
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
