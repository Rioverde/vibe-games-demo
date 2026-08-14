// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_pass_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BattlePassResponse {

/// battle pass payload
 BattlePass get data;
/// Create a copy of BattlePassResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattlePassResponseCopyWith<BattlePassResponse> get copyWith => _$BattlePassResponseCopyWithImpl<BattlePassResponse>(this as BattlePassResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattlePassResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'BattlePassResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $BattlePassResponseCopyWith<$Res>  {
  factory $BattlePassResponseCopyWith(BattlePassResponse value, $Res Function(BattlePassResponse) _then) = _$BattlePassResponseCopyWithImpl;
@useResult
$Res call({
 BattlePass data
});


$BattlePassCopyWith<$Res> get data;

}
/// @nodoc
class _$BattlePassResponseCopyWithImpl<$Res>
    implements $BattlePassResponseCopyWith<$Res> {
  _$BattlePassResponseCopyWithImpl(this._self, this._then);

  final BattlePassResponse _self;
  final $Res Function(BattlePassResponse) _then;

/// Create a copy of BattlePassResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(BattlePassResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BattlePass,
  ));
}
/// Create a copy of BattlePassResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattlePassCopyWith<$Res> get data {
  
  return $BattlePassCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BattlePassResponse].
extension BattlePassResponsePatterns on BattlePassResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattlePassResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattlePassResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattlePassResponse value)  $default,){
final _that = this;
switch (_that) {
case _BattlePassResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattlePassResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BattlePassResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BattlePass data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattlePassResponse() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BattlePass data)  $default,) {final _that = this;
switch (_that) {
case _BattlePassResponse():
return $default(_that.data);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BattlePass data)?  $default,) {final _that = this;
switch (_that) {
case _BattlePassResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _BattlePassResponse implements BattlePassResponse {
  const _BattlePassResponse({this.data = const BattlePass()});
  factory _BattlePassResponse.fromJson(Map<String, dynamic> json) => _$BattlePassResponseFromJson(json);

/// battle pass payload
@override@JsonKey() final  BattlePass data;

/// Create a copy of BattlePassResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattlePassResponseCopyWith<_BattlePassResponse> get copyWith => __$BattlePassResponseCopyWithImpl<_BattlePassResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattlePassResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'BattlePassResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$BattlePassResponseCopyWith<$Res> implements $BattlePassResponseCopyWith<$Res> {
  factory _$BattlePassResponseCopyWith(_BattlePassResponse value, $Res Function(_BattlePassResponse) _then) = __$BattlePassResponseCopyWithImpl;
@override @useResult
$Res call({
 BattlePass data
});


@override $BattlePassCopyWith<$Res> get data;

}
/// @nodoc
class __$BattlePassResponseCopyWithImpl<$Res>
    implements _$BattlePassResponseCopyWith<$Res> {
  __$BattlePassResponseCopyWithImpl(this._self, this._then);

  final _BattlePassResponse _self;
  final $Res Function(_BattlePassResponse) _then;

/// Create a copy of BattlePassResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_BattlePassResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BattlePass,
  ));
}

/// Create a copy of BattlePassResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattlePassCopyWith<$Res> get data {
  
  return $BattlePassCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
