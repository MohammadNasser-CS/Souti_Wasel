import 'dart:convert';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
  });

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'firstName': firstName});
    result.addAll({'email': email});
    result.addAll({'lastName': lastName});
    result.addAll({'role': role});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'].toString(),
      firstName: map['firstName'] ?? '',
      email: map['email'] ?? '',
      lastName: map['lastName'] ?? '',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, email: $email, lastName: $lastName, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.firstName == firstName &&
        other.email == email &&
        other.lastName == lastName &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        email.hashCode ^
        lastName.hashCode ^
        role.hashCode;
  }
}

List<UserModel> dummyUsers = [
  UserModel(
    id: '100',
    firstName: 'محمد',
    email: 'abualnasser04@gmail.com',
    lastName: 'ناصر',
    role: 'طالب',
  ),
];
//   UserModel(
//     token: '122',
//     name: 'مالك 1',
//     email: 'abualnasser55@gmail.com',
//     phoneNumber: '0561234567',
//     gender: 'ذكر',
//     college: null,
//     role: 'صاحب سكن',
//     birthDate: '28-10-2004',
//   ),
//   UserModel(
//     token: '121',
//     name: 'مستخدم 1',
//     email: 'abualnasser05@gmail.com',
//     phoneNumber: '0561234567',
//     gender: 'ذكر',
//     college: null,
//     role: 'أدمن',
//     birthDate: '28-10-2004',
//   ),
// ];
