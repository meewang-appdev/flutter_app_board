import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';

@freezed
class Board with _$Board {
  const factory Board({
    required int id,
    required String name,
    required String slug,
    required bool loginRequired,
    required bool adminOnly,
  }) = _Board;
}