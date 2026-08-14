// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Level {

/// level number, printed on the pin under the card
 int get number;/// whether the rewards are locked, claimable or already taken
 LevelState get state;/// final level of the season — bigger card with a frame
 bool get big;/// rewards of this level, claimed together
 List<Reward> get rewards;
/// Create a copy of Level
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LevelCopyWith<Level> get copyWith => _$LevelCopyWithImpl<Level>(this as Level, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Level&&(identical(other.number, number) || other.number == number)&&(identical(other.state, state) || other.state == state)&&(identical(other.big, big) || other.big == big)&&const DeepCollectionEquality().equals(other.rewards, rewards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,state,big,const DeepCollectionEquality().hash(rewards));

@override
String toString() {
  return 'Level(number: $number, state: $state, big: $big, rewards: $rewards)';
}


}

/// @nodoc
abstract mixin class $LevelCopyWith<$Res>  {
  factory $LevelCopyWith(Level value, $Res Function(Level) _then) = _$LevelCopyWithImpl;
@useResult
$Res call({
 int number, LevelState state, bool big, List<Reward> rewards
});




}
/// @nodoc
class _$LevelCopyWithImpl<$Res>
    implements $LevelCopyWith<$Res> {
  _$LevelCopyWithImpl(this._self, this._then);

  final Level _self;
  final $Res Function(Level) _then;

/// Create a copy of Level
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? state = null,Object? big = null,Object? rewards = null,}) {
  return _then(Level(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as LevelState,big: null == big ? _self.big : big // ignore: cast_nullable_to_non_nullable
as bool,rewards: null == rewards ? _self.rewards : rewards // ignore: cast_nullable_to_non_nullable
as List<Reward>,
  ));
}

}


/// Adds pattern-matching-related methods to [Level].
extension LevelPatterns on Level {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Level value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Level() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Level value)  $default,){
final _that = this;
switch (_that) {
case _Level():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Level value)?  $default,){
final _that = this;
switch (_that) {
case _Level() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  LevelState state,  bool big,  List<Reward> rewards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Level() when $default != null:
return $default(_that.number,_that.state,_that.big,_that.rewards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  LevelState state,  bool big,  List<Reward> rewards)  $default,) {final _that = this;
switch (_that) {
case _Level():
return $default(_that.number,_that.state,_that.big,_that.rewards);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  LevelState state,  bool big,  List<Reward> rewards)?  $default,) {final _that = this;
switch (_that) {
case _Level() when $default != null:
return $default(_that.number,_that.state,_that.big,_that.rewards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _Level extends Level {
  const _Level({this.number = 0, this.state = LevelState.locked, this.big = false, this.rewards = const <Reward>[]}): super._();
  factory _Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);

/// level number, printed on the pin under the card
@override@JsonKey() final  int number;
/// whether the rewards are locked, claimable or already taken
@override@JsonKey() final  LevelState state;
/// final level of the season — bigger card with a frame
@override@JsonKey() final  bool big;
/// rewards of this level, claimed together
@override@JsonKey() final  List<Reward> rewards;

/// Create a copy of Level
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LevelCopyWith<_Level> get copyWith => __$LevelCopyWithImpl<_Level>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Level&&(identical(other.number, number) || other.number == number)&&(identical(other.state, state) || other.state == state)&&(identical(other.big, big) || other.big == big)&&const DeepCollectionEquality().equals(other.rewards, rewards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,state,big,const DeepCollectionEquality().hash(rewards));

@override
String toString() {
  return 'Level(number: $number, state: $state, big: $big, rewards: $rewards)';
}


}

/// @nodoc
abstract mixin class _$LevelCopyWith<$Res> implements $LevelCopyWith<$Res> {
  factory _$LevelCopyWith(_Level value, $Res Function(_Level) _then) = __$LevelCopyWithImpl;
@override @useResult
$Res call({
 int number, LevelState state, bool big, List<Reward> rewards
});




}
/// @nodoc
class __$LevelCopyWithImpl<$Res>
    implements _$LevelCopyWith<$Res> {
  __$LevelCopyWithImpl(this._self, this._then);

  final _Level _self;
  final $Res Function(_Level) _then;

/// Create a copy of Level
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? state = null,Object? big = null,Object? rewards = null,}) {
  return _then(_Level(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as LevelState,big: null == big ? _self.big : big // ignore: cast_nullable_to_non_nullable
as bool,rewards: null == rewards ? _self.rewards : rewards // ignore: cast_nullable_to_non_nullable
as List<Reward>,
  ));
}


}

// dart format on
