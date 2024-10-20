// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) {
  return _ScoreModel.fromJson(json);
}

/// @nodoc
mixin _$ScoreModel {
  int get cellNumber => throw _privateConstructorUsedError;
  int get challengeNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreModelCopyWith<ScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreModelCopyWith<$Res> {
  factory $ScoreModelCopyWith(
          ScoreModel value, $Res Function(ScoreModel) then) =
      _$ScoreModelCopyWithImpl<$Res, ScoreModel>;
  @useResult
  $Res call({int cellNumber, int challengeNumber});
}

/// @nodoc
class _$ScoreModelCopyWithImpl<$Res, $Val extends ScoreModel>
    implements $ScoreModelCopyWith<$Res> {
  _$ScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cellNumber = null,
    Object? challengeNumber = null,
  }) {
    return _then(_value.copyWith(
      cellNumber: null == cellNumber
          ? _value.cellNumber
          : cellNumber // ignore: cast_nullable_to_non_nullable
              as int,
      challengeNumber: null == challengeNumber
          ? _value.challengeNumber
          : challengeNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreModelImplCopyWith<$Res>
    implements $ScoreModelCopyWith<$Res> {
  factory _$$ScoreModelImplCopyWith(
          _$ScoreModelImpl value, $Res Function(_$ScoreModelImpl) then) =
      __$$ScoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cellNumber, int challengeNumber});
}

/// @nodoc
class __$$ScoreModelImplCopyWithImpl<$Res>
    extends _$ScoreModelCopyWithImpl<$Res, _$ScoreModelImpl>
    implements _$$ScoreModelImplCopyWith<$Res> {
  __$$ScoreModelImplCopyWithImpl(
      _$ScoreModelImpl _value, $Res Function(_$ScoreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cellNumber = null,
    Object? challengeNumber = null,
  }) {
    return _then(_$ScoreModelImpl(
      cellNumber: null == cellNumber
          ? _value.cellNumber
          : cellNumber // ignore: cast_nullable_to_non_nullable
              as int,
      challengeNumber: null == challengeNumber
          ? _value.challengeNumber
          : challengeNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreModelImpl implements _ScoreModel {
  const _$ScoreModelImpl(
      {required this.cellNumber, required this.challengeNumber});

  factory _$ScoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreModelImplFromJson(json);

  @override
  final int cellNumber;
  @override
  final int challengeNumber;

  @override
  String toString() {
    return 'ScoreModel(cellNumber: $cellNumber, challengeNumber: $challengeNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreModelImpl &&
            (identical(other.cellNumber, cellNumber) ||
                other.cellNumber == cellNumber) &&
            (identical(other.challengeNumber, challengeNumber) ||
                other.challengeNumber == challengeNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cellNumber, challengeNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreModelImplCopyWith<_$ScoreModelImpl> get copyWith =>
      __$$ScoreModelImplCopyWithImpl<_$ScoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreModelImplToJson(
      this,
    );
  }
}

abstract class _ScoreModel implements ScoreModel {
  const factory _ScoreModel(
      {required final int cellNumber,
      required final int challengeNumber}) = _$ScoreModelImpl;

  factory _ScoreModel.fromJson(Map<String, dynamic> json) =
      _$ScoreModelImpl.fromJson;

  @override
  int get cellNumber;
  @override
  int get challengeNumber;
  @override
  @JsonKey(ignore: true)
  _$$ScoreModelImplCopyWith<_$ScoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
