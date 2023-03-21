import 'dart:convert';

class Profile {
  final String name;
  final String email;
  final String dateOfBirth;
  final String phone;
  Profile({
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
  });

  Profile copyWith({
    String? name,
    String? email,
    String? dateOfBirth,
    String? phone,
  }) {
    return Profile(
      name: name ?? this.name,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'dob': dateOfBirth,
      'phone': phone,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      dateOfBirth: map['dob'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Profile(name: $name, email: $email, dateOfBirth: $dateOfBirth, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Profile &&
        other.name == name &&
        other.email == email &&
        other.dateOfBirth == dateOfBirth &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ dateOfBirth.hashCode ^ phone.hashCode;
  }
}
