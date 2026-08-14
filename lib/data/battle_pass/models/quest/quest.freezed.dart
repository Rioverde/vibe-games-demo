// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quest {

/// id of the quest
 int get id;/// condition text, e.g. "Использовать предмет 10 раз"
 String get text;/// how much battle pass experience it grants
 int get xpReward;/// current progress
 int get progress;/// target value; progress/goal drives the fraction and the bar
 int get goal;/// the experience has been collected
 bool get claimed;/// unix time the quest expires at; 0 never expires
 int get expiresAt;
/// Create a copy of Quest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestCopyWith<Quest> get copyWith => _$QuestCopyWithImpl<Quest>(this as Quest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quest&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.claimed, claimed) || other.claimed == claimed)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,xpReward,progress,goal,claimed,expiresAt);

@override
String toString() {
  return 'Quest(id: $id, text: $text, xpReward: $xpReward, progress: $progress, goal: $goal, claimed: $claimed, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $QuestCopyWith<$Res>  {
  factory $QuestCopyWith(Quest value, $Res Function(Quest) _then) = _$QuestCopyWithImpl;
@useResult
$Res call({
 int id, String text, int xpReward, int progress, int goal, bool claimed, int expiresAt
});




}
/// @nodoc
class _$QuestCopyWithImpl<$Res>
    implements $QuestCopyWith<$Res> {
  _$QuestCopyWithImpl(this._self, this._then);

  final Quest _self;
  final $Res Function(Quest) _then;

/// Create a copy of Quest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? xpReward = null,Object? progress = null,Object? goal = null,Object? claimed = null,Object? expiresAt = null,}) {
  return _then(Quest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,xpReward: null == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Quest].
extension QuestPatterns on Quest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quest value)  $default,){
final _that = this;
switch (_that) {
case _Quest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quest value)?  $default,){
final _that = this;
switch (_that) {
case _Quest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String text,  int xpReward,  int progress,  int goal,  bool claimed,  int expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quest() when $default != null:
return $default(_that.id,_that.text,_that.xpReward,_that.progress,_that.goal,_that.claimed,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String text,  int xpReward,  int progress,  int goal,  bool claimed,  int expiresAt)  $default,) {final _that = this;
switch (_that) {
case _Quest():
return $default(_that.id,_that.text,_that.xpReward,_that.progress,_that.goal,_that.claimed,_that.expiresAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String text,  int xpReward,  int progress,  int goal,  bool claimed,  int expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _Quest() when $default != null:
return $default(_that.id,_that.text,_that.xpReward,_that.progress,_that.goal,_that.claimed,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _Quest extends Quest {
  const _Quest({this.id = 0, this.text = '', this.xpReward = 0, this.progress = 0, this.goal = 0, this.claimed = false, this.expiresAt = 0}): super._();
  factory _Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

/// id of the quest
@override@JsonKey() final  int id;
/// condition text, e.g. "Использовать предмет 10 раз"
@override@JsonKey() final  String text;
/// how much battle pass experience it grants
@override@JsonKey() final  int xpReward;
/// current progress
@override@JsonKey() final  int progress;
/// target value; progress/goal drives the fraction and the bar
@override@JsonKey() final  int goal;
/// the experience has been collected
@override@JsonKey() final  bool claimed;
/// unix time the quest expires at; 0 never expires
@override@JsonKey() final  int expiresAt;

/// Create a copy of Quest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestCopyWith<_Quest> get copyWith => __$QuestCopyWithImpl<_Quest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quest&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.claimed, claimed) || other.claimed == claimed)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,xpReward,progress,goal,claimed,expiresAt);

@override
String toString() {
  return 'Quest(id: $id, text: $text, xpReward: $xpReward, progress: $progress, goal: $goal, claimed: $claimed, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$QuestCopyWith<$Res> implements $QuestCopyWith<$Res> {
  factory _$QuestCopyWith(_Quest value, $Res Function(_Quest) _then) = __$QuestCopyWithImpl;
@override @useResult
$Res call({
 int id, String text, int xpReward, int progress, int goal, bool claimed, int expiresAt
});




}
/// @nodoc
class __$QuestCopyWithImpl<$Res>
    implements _$QuestCopyWith<$Res> {
  __$QuestCopyWithImpl(this._self, this._then);

  final _Quest _self;
  final $Res Function(_Quest) _then;

/// Create a copy of Quest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? xpReward = null,Object? progress = null,Object? goal = null,Object? claimed = null,Object? expiresAt = null,}) {
  return _then(_Quest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,xpReward: null == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
