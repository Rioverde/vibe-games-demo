// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reward {

/// id of the reward
 int get id;/// name shown once the reward is selected
 String get name;/// asset key of the item art
 String get icon;/// quantity; 1 draws no "xN" pill
 int get amount;/// card tier, see [RewardTier]
 RewardTier get tier;/// lies on the premium track: crown badge instead of a gift
 bool get premium;/// text behind the "i" next to the name; empty hides the icon
 String get hint;
/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardCopyWith<Reward> get copyWith => _$RewardCopyWithImpl<Reward>(this as Reward, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reward&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.hint, hint) || other.hint == hint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,amount,tier,premium,hint);

@override
String toString() {
  return 'Reward(id: $id, name: $name, icon: $icon, amount: $amount, tier: $tier, premium: $premium, hint: $hint)';
}


}

/// @nodoc
abstract mixin class $RewardCopyWith<$Res>  {
  factory $RewardCopyWith(Reward value, $Res Function(Reward) _then) = _$RewardCopyWithImpl;
@useResult
$Res call({
 int id, String name, String icon, int amount, RewardTier tier, bool premium, String hint
});




}
/// @nodoc
class _$RewardCopyWithImpl<$Res>
    implements $RewardCopyWith<$Res> {
  _$RewardCopyWithImpl(this._self, this._then);

  final Reward _self;
  final $Res Function(Reward) _then;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = null,Object? amount = null,Object? tier = null,Object? premium = null,Object? hint = null,}) {
  return _then(Reward(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as RewardTier,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as bool,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Reward].
extension RewardPatterns on Reward {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reward value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reward() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reward value)  $default,){
final _that = this;
switch (_that) {
case _Reward():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reward value)?  $default,){
final _that = this;
switch (_that) {
case _Reward() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String icon,  int amount,  RewardTier tier,  bool premium,  String hint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reward() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.amount,_that.tier,_that.premium,_that.hint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String icon,  int amount,  RewardTier tier,  bool premium,  String hint)  $default,) {final _that = this;
switch (_that) {
case _Reward():
return $default(_that.id,_that.name,_that.icon,_that.amount,_that.tier,_that.premium,_that.hint);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String icon,  int amount,  RewardTier tier,  bool premium,  String hint)?  $default,) {final _that = this;
switch (_that) {
case _Reward() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.amount,_that.tier,_that.premium,_that.hint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _Reward extends Reward {
  const _Reward({this.id = 0, this.name = '', this.icon = '', this.amount = 1, this.tier = RewardTier.common, this.premium = false, this.hint = ''}): super._();
  factory _Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

/// id of the reward
@override@JsonKey() final  int id;
/// name shown once the reward is selected
@override@JsonKey() final  String name;
/// asset key of the item art
@override@JsonKey() final  String icon;
/// quantity; 1 draws no "xN" pill
@override@JsonKey() final  int amount;
/// card tier, see [RewardTier]
@override@JsonKey() final  RewardTier tier;
/// lies on the premium track: crown badge instead of a gift
@override@JsonKey() final  bool premium;
/// text behind the "i" next to the name; empty hides the icon
@override@JsonKey() final  String hint;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardCopyWith<_Reward> get copyWith => __$RewardCopyWithImpl<_Reward>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reward&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.hint, hint) || other.hint == hint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,amount,tier,premium,hint);

@override
String toString() {
  return 'Reward(id: $id, name: $name, icon: $icon, amount: $amount, tier: $tier, premium: $premium, hint: $hint)';
}


}

/// @nodoc
abstract mixin class _$RewardCopyWith<$Res> implements $RewardCopyWith<$Res> {
  factory _$RewardCopyWith(_Reward value, $Res Function(_Reward) _then) = __$RewardCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String icon, int amount, RewardTier tier, bool premium, String hint
});




}
/// @nodoc
class __$RewardCopyWithImpl<$Res>
    implements _$RewardCopyWith<$Res> {
  __$RewardCopyWithImpl(this._self, this._then);

  final _Reward _self;
  final $Res Function(_Reward) _then;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = null,Object? amount = null,Object? tier = null,Object? premium = null,Object? hint = null,}) {
  return _then(_Reward(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as RewardTier,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as bool,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
