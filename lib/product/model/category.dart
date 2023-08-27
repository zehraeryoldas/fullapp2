import 'package:equatable/equatable.dart';

import '../utility/base/base_model.dart';

class CategoryModel
    with EquatableMixin, IdModel, BaseFirebaseModel<CategoryModel> {
  final String? detail;
  final String? name;
  @override
  final String? id;

  CategoryModel({this.detail, this.name, this.id});

  @override
  List<Object?> get props => [detail, name, id];

  CategoryModel copyWith({
    String? detail,
    String? name,
  }) {
    return CategoryModel(
      detail: detail ?? this.detail,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'detail': detail,
      'name': name,
    };
  }

  @override
  CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      detail: json['detail'] as String?,
      name: json['name'] as String?,
    );
  }
}
