import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_model.freezed.dart';
part 'board_model.g.dart';

@freezed
class BoardModel with _$BoardModel {
  const factory BoardModel({
    required int id,
    required String name,
    required String slug,
    @JsonKey(name: 'login_required') required bool loginRequired,
    @JsonKey(name: 'admin_only') required bool adminOnly,
  }) = _BoardModel;

  factory BoardModel.fromJson(Map<String, dynamic> json) => _$BoardModelFromJson(json);
}