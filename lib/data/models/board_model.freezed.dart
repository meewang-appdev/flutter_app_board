// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BoardModel _$BoardModelFromJson(Map<String, dynamic> json) {
  return _BoardModel.fromJson(json);
}

/// @nodoc
mixin _$BoardModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'login_required')
  bool get loginRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_only')
  bool get adminOnly => throw _privateConstructorUsedError;

  /// Serializes this BoardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardModelCopyWith<BoardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardModelCopyWith<$Res> {
  factory $BoardModelCopyWith(
    BoardModel value,
    $Res Function(BoardModel) then,
  ) = _$BoardModelCopyWithImpl<$Res, BoardModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String slug,
    @JsonKey(name: 'login_required') bool loginRequired,
    @JsonKey(name: 'admin_only') bool adminOnly,
  });
}

/// @nodoc
class _$BoardModelCopyWithImpl<$Res, $Val extends BoardModel>
    implements $BoardModelCopyWith<$Res> {
  _$BoardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? loginRequired = null,
    Object? adminOnly = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            slug:
                null == slug
                    ? _value.slug
                    : slug // ignore: cast_nullable_to_non_nullable
                        as String,
            loginRequired:
                null == loginRequired
                    ? _value.loginRequired
                    : loginRequired // ignore: cast_nullable_to_non_nullable
                        as bool,
            adminOnly:
                null == adminOnly
                    ? _value.adminOnly
                    : adminOnly // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BoardModelImplCopyWith<$Res>
    implements $BoardModelCopyWith<$Res> {
  factory _$$BoardModelImplCopyWith(
    _$BoardModelImpl value,
    $Res Function(_$BoardModelImpl) then,
  ) = __$$BoardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String slug,
    @JsonKey(name: 'login_required') bool loginRequired,
    @JsonKey(name: 'admin_only') bool adminOnly,
  });
}

/// @nodoc
class __$$BoardModelImplCopyWithImpl<$Res>
    extends _$BoardModelCopyWithImpl<$Res, _$BoardModelImpl>
    implements _$$BoardModelImplCopyWith<$Res> {
  __$$BoardModelImplCopyWithImpl(
    _$BoardModelImpl _value,
    $Res Function(_$BoardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? loginRequired = null,
    Object? adminOnly = null,
  }) {
    return _then(
      _$BoardModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        slug:
            null == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                    as String,
        loginRequired:
            null == loginRequired
                ? _value.loginRequired
                : loginRequired // ignore: cast_nullable_to_non_nullable
                    as bool,
        adminOnly:
            null == adminOnly
                ? _value.adminOnly
                : adminOnly // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardModelImpl implements _BoardModel {
  const _$BoardModelImpl({
    required this.id,
    required this.name,
    required this.slug,
    @JsonKey(name: 'login_required') required this.loginRequired,
    @JsonKey(name: 'admin_only') required this.adminOnly,
  });

  factory _$BoardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  @JsonKey(name: 'login_required')
  final bool loginRequired;
  @override
  @JsonKey(name: 'admin_only')
  final bool adminOnly;

  @override
  String toString() {
    return 'BoardModel(id: $id, name: $name, slug: $slug, loginRequired: $loginRequired, adminOnly: $adminOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.loginRequired, loginRequired) ||
                other.loginRequired == loginRequired) &&
            (identical(other.adminOnly, adminOnly) ||
                other.adminOnly == adminOnly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, loginRequired, adminOnly);

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardModelImplCopyWith<_$BoardModelImpl> get copyWith =>
      __$$BoardModelImplCopyWithImpl<_$BoardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardModelImplToJson(this);
  }
}

abstract class _BoardModel implements BoardModel {
  const factory _BoardModel({
    required final int id,
    required final String name,
    required final String slug,
    @JsonKey(name: 'login_required') required final bool loginRequired,
    @JsonKey(name: 'admin_only') required final bool adminOnly,
  }) = _$BoardModelImpl;

  factory _BoardModel.fromJson(Map<String, dynamic> json) =
      _$BoardModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(name: 'login_required')
  bool get loginRequired;
  @override
  @JsonKey(name: 'admin_only')
  bool get adminOnly;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardModelImplCopyWith<_$BoardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
