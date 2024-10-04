// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  FetchDataStatus get fetchListStarshipsStatus =>
      throw _privateConstructorUsedError;
  List<StarShipEntity> get listStarshipsStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {FetchDataStatus fetchListStarshipsStatus,
      List<StarShipEntity> listStarshipsStatus});

  $FetchDataStatusCopyWith<$Res> get fetchListStarshipsStatus;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchListStarshipsStatus = null,
    Object? listStarshipsStatus = null,
  }) {
    return _then(_value.copyWith(
      fetchListStarshipsStatus: null == fetchListStarshipsStatus
          ? _value.fetchListStarshipsStatus
          : fetchListStarshipsStatus // ignore: cast_nullable_to_non_nullable
              as FetchDataStatus,
      listStarshipsStatus: null == listStarshipsStatus
          ? _value.listStarshipsStatus
          : listStarshipsStatus // ignore: cast_nullable_to_non_nullable
              as List<StarShipEntity>,
    ) as $Val);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FetchDataStatusCopyWith<$Res> get fetchListStarshipsStatus {
    return $FetchDataStatusCopyWith<$Res>(_value.fetchListStarshipsStatus,
        (value) {
      return _then(_value.copyWith(fetchListStarshipsStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchDataStatus fetchListStarshipsStatus,
      List<StarShipEntity> listStarshipsStatus});

  @override
  $FetchDataStatusCopyWith<$Res> get fetchListStarshipsStatus;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchListStarshipsStatus = null,
    Object? listStarshipsStatus = null,
  }) {
    return _then(_$HomeStateImpl(
      fetchListStarshipsStatus: null == fetchListStarshipsStatus
          ? _value.fetchListStarshipsStatus
          : fetchListStarshipsStatus // ignore: cast_nullable_to_non_nullable
              as FetchDataStatus,
      listStarshipsStatus: null == listStarshipsStatus
          ? _value._listStarshipsStatus
          : listStarshipsStatus // ignore: cast_nullable_to_non_nullable
              as List<StarShipEntity>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  _$HomeStateImpl(
      {this.fetchListStarshipsStatus = const FetchDataStatus.idle(),
      final List<StarShipEntity> listStarshipsStatus = const []})
      : _listStarshipsStatus = listStarshipsStatus,
        super._();

  @override
  @JsonKey()
  final FetchDataStatus fetchListStarshipsStatus;
  final List<StarShipEntity> _listStarshipsStatus;
  @override
  @JsonKey()
  List<StarShipEntity> get listStarshipsStatus {
    if (_listStarshipsStatus is EqualUnmodifiableListView)
      return _listStarshipsStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listStarshipsStatus);
  }

  @override
  String toString() {
    return 'HomeState(fetchListStarshipsStatus: $fetchListStarshipsStatus, listStarshipsStatus: $listStarshipsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(
                    other.fetchListStarshipsStatus, fetchListStarshipsStatus) ||
                other.fetchListStarshipsStatus == fetchListStarshipsStatus) &&
            const DeepCollectionEquality()
                .equals(other._listStarshipsStatus, _listStarshipsStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetchListStarshipsStatus,
      const DeepCollectionEquality().hash(_listStarshipsStatus));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  factory _HomeState(
      {final FetchDataStatus fetchListStarshipsStatus,
      final List<StarShipEntity> listStarshipsStatus}) = _$HomeStateImpl;
  _HomeState._() : super._();

  @override
  FetchDataStatus get fetchListStarshipsStatus;
  @override
  List<StarShipEntity> get listStarshipsStatus;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
