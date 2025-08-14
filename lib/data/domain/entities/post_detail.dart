import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/author.dart';
import '../../../domain/entities/board.dart';
import '../../../domain/entities/category.dart';

part 'post_detail.freezed.dart';

@freezed
class PostDetail with _$PostDetail {
  const factory PostDetail({
    required int id,
    required String title,
    required String content,
    required Author author,
    required Board board,
    required Category category,
    required DateTime createdAt,
    required int viewCount,
    required int likeCount,
  }) = _PostDetail;
}