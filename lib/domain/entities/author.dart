import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';

@freezed
class Author with _$Author {
  const factory Author({
    required int id,
    required String nickname,
  }) = _Author;
}