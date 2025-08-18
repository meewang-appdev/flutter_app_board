import 'package:freezed_annotation/freezed_annotation.dart';
import 'author_model.dart';
import 'board_model.dart';
import 'category_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

// 게시글 목록 아이템 모델
@freezed
class PostListItemModel with _$PostListItemModel {
  const factory PostListItemModel({
    required int id,
    required String title,
    required AuthorModel author,
    BoardModel? board,
    required CategoryModel category,
    @JsonKey(name: 'is_notice') @Default(false) bool isNotice,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'view_count') required int viewCount,
    @JsonKey(name: 'like_count') required int likeCount,
  }) = _PostListItemModel;

  factory PostListItemModel.fromJson(Map<String, dynamic> json) => _$PostListItemModelFromJson(json);
}

// 게시글 상세 정보 모델
@freezed
class PostDetailModel with _$PostDetailModel {
  const factory PostDetailModel({
    required int id,
    required String title,
    required String content,
    required AuthorModel author,
    required BoardModel board,
    required CategoryModel category,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'view_count') required int viewCount,
    @JsonKey(name: 'like_count') required int likeCount,
  }) = _PostDetailModel;

  factory PostDetailModel.fromJson(Map<String, dynamic> json) => _$PostDetailModelFromJson(json);
}