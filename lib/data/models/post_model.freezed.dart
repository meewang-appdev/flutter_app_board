// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PostListItemModel _$PostListItemModelFromJson(Map<String, dynamic> json) {
  return _PostListItemModel.fromJson(json);
}

/// @nodoc
mixin _$PostListItemModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  AuthorModel get author => throw _privateConstructorUsedError;
  BoardModel? get board => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_notice')
  bool get isNotice => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;

  /// Serializes this PostListItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostListItemModelCopyWith<PostListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListItemModelCopyWith<$Res> {
  factory $PostListItemModelCopyWith(
    PostListItemModel value,
    $Res Function(PostListItemModel) then,
  ) = _$PostListItemModelCopyWithImpl<$Res, PostListItemModel>;
  @useResult
  $Res call({
    int id,
    String title,
    AuthorModel author,
    BoardModel? board,
    CategoryModel category,
    @JsonKey(name: 'is_notice') bool isNotice,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'view_count') int viewCount,
    @JsonKey(name: 'like_count') int likeCount,
  });

  $AuthorModelCopyWith<$Res> get author;
  $BoardModelCopyWith<$Res>? get board;
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$PostListItemModelCopyWithImpl<$Res, $Val extends PostListItemModel>
    implements $PostListItemModelCopyWith<$Res> {
  _$PostListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? board = freezed,
    Object? category = null,
    Object? isNotice = null,
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
            author:
                null == author
                    ? _value.author
                    : author // ignore: cast_nullable_to_non_nullable
                        as AuthorModel,
            board:
                freezed == board
                    ? _value.board
                    : board // ignore: cast_nullable_to_non_nullable
                        as BoardModel?,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as CategoryModel,
            isNotice:
                null == isNotice
                    ? _value.isNotice
                    : isNotice // ignore: cast_nullable_to_non_nullable
                        as bool,
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

  /// Create a copy of PostListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthorModelCopyWith<$Res> get author {
    return $AuthorModelCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  /// Create a copy of PostListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoardModelCopyWith<$Res>? get board {
    if (_value.board == null) {
      return null;
    }

    return $BoardModelCopyWith<$Res>(_value.board!, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }

  /// Create a copy of PostListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostListItemModelImplCopyWith<$Res>
    implements $PostListItemModelCopyWith<$Res> {
  factory _$$PostListItemModelImplCopyWith(
    _$PostListItemModelImpl value,
    $Res Function(_$PostListItemModelImpl) then,
  ) = __$$PostListItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    AuthorModel author,
    BoardModel? board,
    CategoryModel category,
    @JsonKey(name: 'is_notice') bool isNotice,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'view_count') int viewCount,
    @JsonKey(name: 'like_count') int likeCount,
  });

  @override
  $AuthorModelCopyWith<$Res> get author;
  @override
  $BoardModelCopyWith<$Res>? get board;
  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$PostListItemModelImplCopyWithImpl<$Res>
    extends _$PostListItemModelCopyWithImpl<$Res, _$PostListItemModelImpl>
    implements _$$PostListItemModelImplCopyWith<$Res> {
  __$$PostListItemModelImplCopyWithImpl(
    _$PostListItemModelImpl _value,
    $Res Function(_$PostListItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? board = freezed,
    Object? category = null,
    Object? isNotice = null,
    Object? createdAt = null,
    Object? viewCount = null,
    Object? likeCount = null,
  }) {
    return _then(
      _$PostListItemModelImpl(
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
        author:
            null == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                    as AuthorModel,
        board:
            freezed == board
                ? _value.board
                : board // ignore: cast_nullable_to_non_nullable
                    as BoardModel?,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as CategoryModel,
        isNotice:
            null == isNotice
                ? _value.isNotice
                : isNotice // ignore: cast_nullable_to_non_nullable
                    as bool,
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
@JsonSerializable()
class _$PostListItemModelImpl implements _PostListItemModel {
  const _$PostListItemModelImpl({
    required this.id,
    required this.title,
    required this.author,
    this.board,
    required this.category,
    @JsonKey(name: 'is_notice') this.isNotice = false,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'view_count') required this.viewCount,
    @JsonKey(name: 'like_count') required this.likeCount,
  });

  factory _$PostListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostListItemModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final AuthorModel author;
  @override
  final BoardModel? board;
  @override
  final CategoryModel category;
  @override
  @JsonKey(name: 'is_notice')
  final bool isNotice;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'view_count')
  final int viewCount;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;

  @override
  String toString() {
    return 'PostListItemModel(id: $id, title: $title, author: $author, board: $board, category: $category, isNotice: $isNotice, createdAt: $createdAt, viewCount: $viewCount, likeCount: $likeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isNotice, isNotice) ||
                other.isNotice == isNotice) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    author,
    board,
    category,
    isNotice,
    createdAt,
    viewCount,
    likeCount,
  );

  /// Create a copy of PostListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostListItemModelImplCopyWith<_$PostListItemModelImpl> get copyWith =>
      __$$PostListItemModelImplCopyWithImpl<_$PostListItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PostListItemModelImplToJson(this);
  }
}

abstract class _PostListItemModel implements PostListItemModel {
  const factory _PostListItemModel({
    required final int id,
    required final String title,
    required final AuthorModel author,
    final BoardModel? board,
    required final CategoryModel category,
    @JsonKey(name: 'is_notice') final bool isNotice,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'view_count') required final int viewCount,
    @JsonKey(name: 'like_count') required final int likeCount,
  }) = _$PostListItemModelImpl;

  factory _PostListItemModel.fromJson(Map<String, dynamic> json) =
      _$PostListItemModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  AuthorModel get author;
  @override
  BoardModel? get board;
  @override
  CategoryModel get category;
  @override
  @JsonKey(name: 'is_notice')
  bool get isNotice;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'view_count')
  int get viewCount;
  @override
  @JsonKey(name: 'like_count')
  int get likeCount;

  /// Create a copy of PostListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostListItemModelImplCopyWith<_$PostListItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostDetailModel _$PostDetailModelFromJson(Map<String, dynamic> json) {
  return _PostDetailModel.fromJson(json);
}

/// @nodoc
mixin _$PostDetailModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  AuthorModel get author => throw _privateConstructorUsedError;
  BoardModel get board => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;

  /// Serializes this PostDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDetailModelCopyWith<PostDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailModelCopyWith<$Res> {
  factory $PostDetailModelCopyWith(
    PostDetailModel value,
    $Res Function(PostDetailModel) then,
  ) = _$PostDetailModelCopyWithImpl<$Res, PostDetailModel>;
  @useResult
  $Res call({
    int id,
    String title,
    String content,
    AuthorModel author,
    BoardModel board,
    CategoryModel category,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'view_count') int viewCount,
    @JsonKey(name: 'like_count') int likeCount,
  });

  $AuthorModelCopyWith<$Res> get author;
  $BoardModelCopyWith<$Res> get board;
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$PostDetailModelCopyWithImpl<$Res, $Val extends PostDetailModel>
    implements $PostDetailModelCopyWith<$Res> {
  _$PostDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostDetailModel
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
                        as AuthorModel,
            board:
                null == board
                    ? _value.board
                    : board // ignore: cast_nullable_to_non_nullable
                        as BoardModel,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as CategoryModel,
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

  /// Create a copy of PostDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthorModelCopyWith<$Res> get author {
    return $AuthorModelCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  /// Create a copy of PostDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoardModelCopyWith<$Res> get board {
    return $BoardModelCopyWith<$Res>(_value.board, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }

  /// Create a copy of PostDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostDetailModelImplCopyWith<$Res>
    implements $PostDetailModelCopyWith<$Res> {
  factory _$$PostDetailModelImplCopyWith(
    _$PostDetailModelImpl value,
    $Res Function(_$PostDetailModelImpl) then,
  ) = __$$PostDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String content,
    AuthorModel author,
    BoardModel board,
    CategoryModel category,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'view_count') int viewCount,
    @JsonKey(name: 'like_count') int likeCount,
  });

  @override
  $AuthorModelCopyWith<$Res> get author;
  @override
  $BoardModelCopyWith<$Res> get board;
  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$PostDetailModelImplCopyWithImpl<$Res>
    extends _$PostDetailModelCopyWithImpl<$Res, _$PostDetailModelImpl>
    implements _$$PostDetailModelImplCopyWith<$Res> {
  __$$PostDetailModelImplCopyWithImpl(
    _$PostDetailModelImpl _value,
    $Res Function(_$PostDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostDetailModel
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
      _$PostDetailModelImpl(
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
                    as AuthorModel,
        board:
            null == board
                ? _value.board
                : board // ignore: cast_nullable_to_non_nullable
                    as BoardModel,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as CategoryModel,
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
@JsonSerializable()
class _$PostDetailModelImpl implements _PostDetailModel {
  const _$PostDetailModelImpl({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.board,
    required this.category,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'view_count') required this.viewCount,
    @JsonKey(name: 'like_count') required this.likeCount,
  });

  factory _$PostDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final AuthorModel author;
  @override
  final BoardModel board;
  @override
  final CategoryModel category;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'view_count')
  final int viewCount;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;

  @override
  String toString() {
    return 'PostDetailModel(id: $id, title: $title, content: $content, author: $author, board: $board, category: $category, createdAt: $createdAt, viewCount: $viewCount, likeCount: $likeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDetailModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of PostDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDetailModelImplCopyWith<_$PostDetailModelImpl> get copyWith =>
      __$$PostDetailModelImplCopyWithImpl<_$PostDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PostDetailModelImplToJson(this);
  }
}

abstract class _PostDetailModel implements PostDetailModel {
  const factory _PostDetailModel({
    required final int id,
    required final String title,
    required final String content,
    required final AuthorModel author,
    required final BoardModel board,
    required final CategoryModel category,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'view_count') required final int viewCount,
    @JsonKey(name: 'like_count') required final int likeCount,
  }) = _$PostDetailModelImpl;

  factory _PostDetailModel.fromJson(Map<String, dynamic> json) =
      _$PostDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  AuthorModel get author;
  @override
  BoardModel get board;
  @override
  CategoryModel get category;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'view_count')
  int get viewCount;
  @override
  @JsonKey(name: 'like_count')
  int get likeCount;

  /// Create a copy of PostDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDetailModelImplCopyWith<_$PostDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
