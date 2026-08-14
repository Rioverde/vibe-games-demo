// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Promo {

/// heading, e.g. "Элитный пропуск"
 String get title;/// description under the heading
 String get subtitle;/// button label, e.g. "Повысить уровень"
 String get cta;/// asset key of the banner art
 String get art;/// false at max level — the button turns into a flat plate
 bool get ctaEnabled;/// text of that plate, e.g. "Достигнут максимальный уровень"
 String get ctaDisabledText;/// show "Забрать все награды" under the button
 bool get claimAll;
/// Create a copy of Promo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoCopyWith<Promo> get copyWith => _$PromoCopyWithImpl<Promo>(this as Promo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Promo&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.cta, cta) || other.cta == cta)&&(identical(other.art, art) || other.art == art)&&(identical(other.ctaEnabled, ctaEnabled) || other.ctaEnabled == ctaEnabled)&&(identical(other.ctaDisabledText, ctaDisabledText) || other.ctaDisabledText == ctaDisabledText)&&(identical(other.claimAll, claimAll) || other.claimAll == claimAll));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,cta,art,ctaEnabled,ctaDisabledText,claimAll);

@override
String toString() {
  return 'Promo(title: $title, subtitle: $subtitle, cta: $cta, art: $art, ctaEnabled: $ctaEnabled, ctaDisabledText: $ctaDisabledText, claimAll: $claimAll)';
}


}

/// @nodoc
abstract mixin class $PromoCopyWith<$Res>  {
  factory $PromoCopyWith(Promo value, $Res Function(Promo) _then) = _$PromoCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, String cta, String art, bool ctaEnabled, String ctaDisabledText, bool claimAll
});




}
/// @nodoc
class _$PromoCopyWithImpl<$Res>
    implements $PromoCopyWith<$Res> {
  _$PromoCopyWithImpl(this._self, this._then);

  final Promo _self;
  final $Res Function(Promo) _then;

/// Create a copy of Promo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = null,Object? cta = null,Object? art = null,Object? ctaEnabled = null,Object? ctaDisabledText = null,Object? claimAll = null,}) {
  return _then(Promo(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,cta: null == cta ? _self.cta : cta // ignore: cast_nullable_to_non_nullable
as String,art: null == art ? _self.art : art // ignore: cast_nullable_to_non_nullable
as String,ctaEnabled: null == ctaEnabled ? _self.ctaEnabled : ctaEnabled // ignore: cast_nullable_to_non_nullable
as bool,ctaDisabledText: null == ctaDisabledText ? _self.ctaDisabledText : ctaDisabledText // ignore: cast_nullable_to_non_nullable
as String,claimAll: null == claimAll ? _self.claimAll : claimAll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Promo].
extension PromoPatterns on Promo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Promo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Promo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Promo value)  $default,){
final _that = this;
switch (_that) {
case _Promo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Promo value)?  $default,){
final _that = this;
switch (_that) {
case _Promo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String subtitle,  String cta,  String art,  bool ctaEnabled,  String ctaDisabledText,  bool claimAll)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Promo() when $default != null:
return $default(_that.title,_that.subtitle,_that.cta,_that.art,_that.ctaEnabled,_that.ctaDisabledText,_that.claimAll);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String subtitle,  String cta,  String art,  bool ctaEnabled,  String ctaDisabledText,  bool claimAll)  $default,) {final _that = this;
switch (_that) {
case _Promo():
return $default(_that.title,_that.subtitle,_that.cta,_that.art,_that.ctaEnabled,_that.ctaDisabledText,_that.claimAll);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String subtitle,  String cta,  String art,  bool ctaEnabled,  String ctaDisabledText,  bool claimAll)?  $default,) {final _that = this;
switch (_that) {
case _Promo() when $default != null:
return $default(_that.title,_that.subtitle,_that.cta,_that.art,_that.ctaEnabled,_that.ctaDisabledText,_that.claimAll);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _Promo implements Promo {
  const _Promo({this.title = '', this.subtitle = '', this.cta = '', this.art = '', this.ctaEnabled = true, this.ctaDisabledText = '', this.claimAll = false});
  factory _Promo.fromJson(Map<String, dynamic> json) => _$PromoFromJson(json);

/// heading, e.g. "Элитный пропуск"
@override@JsonKey() final  String title;
/// description under the heading
@override@JsonKey() final  String subtitle;
/// button label, e.g. "Повысить уровень"
@override@JsonKey() final  String cta;
/// asset key of the banner art
@override@JsonKey() final  String art;
/// false at max level — the button turns into a flat plate
@override@JsonKey() final  bool ctaEnabled;
/// text of that plate, e.g. "Достигнут максимальный уровень"
@override@JsonKey() final  String ctaDisabledText;
/// show "Забрать все награды" under the button
@override@JsonKey() final  bool claimAll;

/// Create a copy of Promo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoCopyWith<_Promo> get copyWith => __$PromoCopyWithImpl<_Promo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Promo&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.cta, cta) || other.cta == cta)&&(identical(other.art, art) || other.art == art)&&(identical(other.ctaEnabled, ctaEnabled) || other.ctaEnabled == ctaEnabled)&&(identical(other.ctaDisabledText, ctaDisabledText) || other.ctaDisabledText == ctaDisabledText)&&(identical(other.claimAll, claimAll) || other.claimAll == claimAll));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,cta,art,ctaEnabled,ctaDisabledText,claimAll);

@override
String toString() {
  return 'Promo(title: $title, subtitle: $subtitle, cta: $cta, art: $art, ctaEnabled: $ctaEnabled, ctaDisabledText: $ctaDisabledText, claimAll: $claimAll)';
}


}

/// @nodoc
abstract mixin class _$PromoCopyWith<$Res> implements $PromoCopyWith<$Res> {
  factory _$PromoCopyWith(_Promo value, $Res Function(_Promo) _then) = __$PromoCopyWithImpl;
@override @useResult
$Res call({
 String title, String subtitle, String cta, String art, bool ctaEnabled, String ctaDisabledText, bool claimAll
});




}
/// @nodoc
class __$PromoCopyWithImpl<$Res>
    implements _$PromoCopyWith<$Res> {
  __$PromoCopyWithImpl(this._self, this._then);

  final _Promo _self;
  final $Res Function(_Promo) _then;

/// Create a copy of Promo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? cta = null,Object? art = null,Object? ctaEnabled = null,Object? ctaDisabledText = null,Object? claimAll = null,}) {
  return _then(_Promo(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,cta: null == cta ? _self.cta : cta // ignore: cast_nullable_to_non_nullable
as String,art: null == art ? _self.art : art // ignore: cast_nullable_to_non_nullable
as String,ctaEnabled: null == ctaEnabled ? _self.ctaEnabled : ctaEnabled // ignore: cast_nullable_to_non_nullable
as bool,ctaDisabledText: null == ctaDisabledText ? _self.ctaDisabledText : ctaDisabledText // ignore: cast_nullable_to_non_nullable
as String,claimAll: null == claimAll ? _self.claimAll : claimAll // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
