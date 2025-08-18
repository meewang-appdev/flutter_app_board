
import 'package:freezed_annotation/freezed_annotation.dart';
import 'author.dart';
import 'board.dart';
import 'category.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required String title,
    required Author author,
    Board? board,
    required Category category,
    required bool isNotice,
    required DateTime createdAt,
    required int viewCount,
    required int likeCount,
  }) = _Post;
}