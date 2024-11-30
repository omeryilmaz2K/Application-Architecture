import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'example_model.g.dart';

@JsonSerializable()
final class ExampleModel extends BaseModel {
  ExampleModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  @override
  fromJson(Map<String, dynamic> json) => _$ExampleModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);
}
