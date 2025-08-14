import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_model.freezed.dart';
part 'author_model.g.dart';

@freezed
class AuthorModel with _$AuthorModel {
  const factory AuthorModel({
    required int id,
    required String nickname,
  }) = _AuthorModel;

  factory AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);
}