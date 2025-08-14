// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostListItemModelImpl _$$PostListItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$PostListItemModelImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
  board:
      json['board'] == null
          ? null
          : BoardModel.fromJson(json['board'] as Map<String, dynamic>),
  isNotice: json['is_notice'] as bool? ?? false,
  createdAt: DateTime.parse(json['created_at'] as String),
  viewCount: (json['view_count'] as num).toInt(),
  likeCount: (json['like_count'] as num).toInt(),
);

Map<String, dynamic> _$$PostListItemModelImplToJson(
  _$PostListItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'author': instance.author,
  'board': instance.board,
  'is_notice': instance.isNotice,
  'created_at': instance.createdAt.toIso8601String(),
  'view_count': instance.viewCount,
  'like_count': instance.likeCount,
};

_$PostDetailModelImpl _$$PostDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$PostDetailModelImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String,
  author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
  board: BoardModel.fromJson(json['board'] as Map<String, dynamic>),
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['created_at'] as String),
  viewCount: (json['view_count'] as num).toInt(),
  likeCount: (json['like_count'] as num).toInt(),
);

Map<String, dynamic> _$$PostDetailModelImplToJson(
  _$PostDetailModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'author': instance.author,
  'board': instance.board,
  'category': instance.category,
  'created_at': instance.createdAt.toIso8601String(),
  'view_count': instance.viewCount,
  'like_count': instance.likeCount,
};
