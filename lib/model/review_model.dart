// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReviewModel {
  String homeTown;
  String category;
  String center;
  String description;
  String custService;
  String pricing;
  String pQuality;

  ReviewModel({
    required this.homeTown,
    required this.category,
    required this.center,
    required this.description,
    required this.custService,
    required this.pricing,
    required this.pQuality,
  });

  ReviewModel copyWith({
    String? homeTown,
    String? category,
    String? center,
    String? description,
    String? custService,
    String? pricing,
    String? pQuality,
  }) {
    return ReviewModel(
      homeTown: homeTown ?? this.homeTown,
      category: category ?? this.category,
      center: center ?? this.center,
      description: description ?? this.description,
      custService: custService ?? this.custService,
      pricing: pricing ?? this.pricing,
      pQuality: pQuality ?? this.pQuality,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'homeTown': homeTown,
      'category': category,
      'center': center,
      'description': description,
      'custService': custService,
      'pricing': pricing,
      'pQuality': pQuality,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      homeTown: map['homeTown'] as String,
      category: map['category'] as String,
      center: map['center'] as String,
      description: map['description'] as String,
      custService: map['custService'] as String,
      pricing: map['pricing'] as String,
      pQuality: map['pQuality'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReviewModel(homeTown: $homeTown, category: $category, center: $center, description: $description, custService: $custService, pricing: $pricing, pQuality: $pQuality)';
  }

  @override
  bool operator ==(covariant ReviewModel other) {
    if (identical(this, other)) return true;

    return other.homeTown == homeTown &&
        other.category == category &&
        other.center == center &&
        other.description == description &&
        other.custService == custService &&
        other.pricing == pricing &&
        other.pQuality == pQuality;
  }

  @override
  int get hashCode {
    return homeTown.hashCode ^
        category.hashCode ^
        center.hashCode ^
        description.hashCode ^
        custService.hashCode ^
        pricing.hashCode ^
        pQuality.hashCode;
  }
}
