import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../utility/base/base_model.dart';

@immutable
class Tag with EquatableMixin, IdModel, BaseFirebaseModel<Tag> {
  final String? name;
  final bool? active;
  @override
  final String? id;

  const Tag({
    this.id,
    this.name,
    this.active,
  });

  @override
  List<Object?> get props => [name, active, id];

  Tag copyWith({
    String? name,
    bool? active,
  }) {
    return Tag(
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'active': active,
    };
  }

  @override
  Tag fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return Tag(
      name: json['name'] as String?,
      active: json['active'] as bool?,
    );
  }
}
