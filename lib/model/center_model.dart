// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CenterModel {
  String name;
  String homeTown;
  String category;

  CenterModel({
    required this.name,
    required this.homeTown,
    required this.category,
  });

  CenterModel copyWith({
    String? name,
    String? homeTown,
    String? category,
  }) {
    return CenterModel(
      name: name ?? this.name,
      homeTown: homeTown ?? this.homeTown,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'homeTown': homeTown,
      'category': category,
    };
  }

  factory CenterModel.fromMap(Map<String, dynamic> map) {
    return CenterModel(
      name: map['name'] as String,
      homeTown: map['homeTown'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CenterModel.fromJson(String source) =>
      CenterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CenterModel(name: $name, homeTown: $homeTown, category: $category)';

  @override
  bool operator ==(covariant CenterModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.homeTown == homeTown &&
        other.category == category;
  }

  @override
  int get hashCode => name.hashCode ^ homeTown.hashCode ^ category.hashCode;
}
