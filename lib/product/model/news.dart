import 'package:equatable/equatable.dart';
import 'package:fullapp2/product/utility/base/base_model.dart';

class News extends Equatable with IdModel, BaseFirebaseModel<News> {
  final String? category;
  final String? categoryId;
  final String? title;
  final String? image;
  @override
  final String? id;

  const News({
    this.category,
    this.categoryId,
    this.title,
    this.image,
    this.id,
  });

  @override
  List<Object?> get props => [category, categoryId, title, image, id];

  News copyWith({
    String? category,
    String? categoryId,
    String? title,
    String? image,
    String? id,
  }) {
    return News(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'image': image,
      'id': id,
    };
  }

  // factory News.fromJson(Map<String, dynamic> json) {
  //   return News(
  //     category: json['category'] as String?,
  //     categoryId: json['categoryId'] as String?,
  //     title: json['title'] as String?,
  //     image: json['image'] as String?,
  //     id: json['id'] as String?,
  //   );
  // }

  @override
  News fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return News(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      id: json['id'] as String?,
    );
  }
}
