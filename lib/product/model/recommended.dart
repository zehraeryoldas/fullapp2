import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../utility/base/base_model.dart';

@immutable
class Recommended with EquatableMixin, IdModel, BaseFirebaseModel<Recommended> {
  final String? description;
  final String? image;
  final String? title;
  @override
  final String? id;

  Recommended({
    this.id,
    this.description,
    this.image,
    this.title,
  });

  @override
  List<Object?> get props => [description, image, title, id];

  Recommended copyWith({
    String? description,
    String? image,
    String? title,
  }) {
    return Recommended(
      description: description ?? this.description,
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'image': image,
      'title': title,
    };
  }

  @override
  Recommended fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return Recommended(
      description: json['description'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
    );
  }
}
