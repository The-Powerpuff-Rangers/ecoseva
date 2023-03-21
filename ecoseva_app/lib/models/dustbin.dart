import 'dart:convert';

class Dustbin {
  final int id;
  final String coordinates;
  final String location;
  final int capacity;
  final DateTime createdAt;
  final DateTime updatedAt;
  Dustbin({
    required this.id,
    required this.coordinates,
    required this.location,
    required this.capacity,
    required this.createdAt,
    required this.updatedAt,
  });

  Dustbin copyWith({
    int? id,
    String? coordinates,
    String? location,
    int? capacity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Dustbin(
      id: id ?? this.id,
      coordinates: coordinates ?? this.coordinates,
      location: location ?? this.location,
      capacity: capacity ?? this.capacity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'coordinates': coordinates,
      'location': location,
      'capacity': capacity,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Dustbin.fromMap(Map<String, dynamic> map) {
    return Dustbin(
      id: map['id']?.toInt() ?? 0,
      coordinates: map['coordinates'] ?? '',
      location: map['location'] ?? '',
      capacity: map['capacity']?.toInt() ?? 0,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Dustbin.fromJson(String source) => Dustbin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dustbin(id: $id, coordinates: $coordinates, location: $location, capacity: $capacity, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dustbin &&
        other.id == id &&
        other.coordinates == coordinates &&
        other.location == location &&
        other.capacity == capacity &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        coordinates.hashCode ^
        location.hashCode ^
        capacity.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
