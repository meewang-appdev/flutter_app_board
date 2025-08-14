// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostDetail {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  Board get board => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDetailCopyWith<PostDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailCopyWith<$Res> {
  factory $PostDetailCopyWith(
    PostDetail value,
    $Res Function(PostDetail) then,
  ) = _$PostDetailCopyWithImpl<$Res, PostDetail>;
  @useResult
  $Res call({
    int id,
    String title,
    String content,
    Author author,
    Board board,
    Category category,
    DateTime createdAt,
    int viewCount,
    int likeCount,
  });

  $AuthorCopyWith<$Res> get author;
  $BoardCopyWith<$Res> get board;
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$PostDetailCopyWithImpl<$Res, $Val extends PostDetail>
    implements $PostDetailCopyWith<$Res> {
  _$PostDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? author = null,
    Object? board = null,
    Object? category = null,
    Object? createdAt = null,
    Object? viewCount = null,
    Object? likeCount = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            author:
                null == author
                    ? _value.author
                    : author // ignore: cast_nullable_to_non_nullable
                        as Author,
            board:
                null == board
                    ? _value.board
                    : board // ignore: cast_nullable_to_non_nullable
                        as Board,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            viewCount:
                null == viewCount
                    ? _value.viewCount
                    : viewCount // ignore: cast_nullable_to_non_nullable
                        as int,
            likeCount:
                null == likeCount
                    ? _value.likeCount
                    : likeCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<$Res> get author {
    return $AuthorCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoardCopyWith<$Res> get board {
    return $BoardCopyWith<$Res>(_value.board, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostDetailImplCopyWith<$Res>
    implements $PostDetailCopyWith<$Res> {
  factory _$$PostDetailImplCopyWith(
    _$PostDetailImpl value,
    $Res Function(_$PostDetailImpl) then,
  ) = __$$PostDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String content,
    Author author,
    Board board,
    Category category,
    DateTime createdAt,
    int viewCount,
    int likeCount,
  });

  @override
  $AuthorCopyWith<$Res> get author;
  @override
  $BoardCopyWith<$Res> get board;
  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$PostDetailImplCopyWithImpl<$Res>
    extends _$PostDetailCopyWithImpl<$Res, _$PostDetailImpl>
    implements _$$PostDetailImplCopyWith<$Res> {
  __$$PostDetailImplCopyWithImpl(
    _$PostDetailImpl _value,
    $Res Function(_$PostDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? author = null,
    Object? board = null,
    Object? category = null,
    Object? createdAt = null,
    Object? viewCount = null,
    Object? likeCount = null,
  }) {
    return _then(
      _$PostDetailImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        author:
            null == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                    as Author,
        board:
            null == board
                ? _value.board
                : board // ignore: cast_nullable_to_non_nullable
                    as Board,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        viewCount:
            null == viewCount
                ? _value.viewCount
                : viewCount // ignore: cast_nullable_to_non_nullable
                    as int,
        likeCount:
            null == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$PostDetailImpl implements _PostDetail {
  const _$PostDetailImpl({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.board,
    required this.category,
    required this.createdAt,
    required this.viewCount,
    required this.likeCount,
  });

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final Author author;
  @override
  final Board board;
  @override
  final Category category;
  @override
  final DateTime createdAt;
  @override
  final int viewCount;
  @override
  final int likeCount;

  @override
  String toString() {
    return 'PostDetail(id: $id, title: $title, content: $content, author: $author, board: $board, category: $category, createdAt: $createdAt, viewCount: $viewCount, likeCount: $likeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    content,
    author,
    board,
    category,
    createdAt,
    viewCount,
    likeCount,
  );

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDetailImplCopyWith<_$PostDetailImpl> get copyWith =>
      __$$PostDetailImplCopyWithImpl<_$PostDetailImpl>(this, _$identity);
}

abstract class _PostDetail implements PostDetail {
  const factory _PostDetail({
    required final int id,
    required final String title,
    required final String content,
    required final Author author,
    required final Board board,
    required final Category category,
    required final DateTime createdAt,
    required final int viewCount,
    required final int likeCount,
  }) = _$PostDetailImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  Author get author;
  @override
  Board get board;
  @override
  Category get category;
  @override
  DateTime get createdAt;
  @override
  int get viewCount;
  @override
  int get likeCount;

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDetailImplCopyWith<_$PostDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
