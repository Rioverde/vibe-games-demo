// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_pass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BattlePass {

/// id of the season
 int get seasonId;/// season heading in the info bar, e.g. "Дай пять!"
 String get seasonTitle;/// unix time the season ends at; drives the info bar timer
 int get endsAt;/// current level — the number inside the ring
 int get level;/// last level of the season
 int get maxLevel;/// experience gained inside the current level
 int get xp;/// experience needed for the next level; xp/xpPerLevel fills the ring
 int get xpPerLevel;/// whether the premium track is owned — the main state switch
 bool get premiumOwned;/// season is over but rewards are still claimable until this unix time
 int get claimDeadline;/// which level is opened in the middle of the screen
 int get selectedLevel;/// right-hand promo panel
 Promo get promo;/// the reward track
 List<Level> get levels;/// quests for the second screen and the preview card
 List<Quest> get quests;/// rewards waiting to be collected, gathered at the head of the track
///
/// Kept apart from [levels] because the mockup numbers the level pins 1, 2,
/// 3 … without a break while these carry no pin at all. They are not tied
/// to the pass either: the same cluster and its "collect all" bar are drawn
/// whether or not the premium is owned.
 List<Reward> get pendingRewards;
/// Create a copy of BattlePass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattlePassCopyWith<BattlePass> get copyWith => _$BattlePassCopyWithImpl<BattlePass>(this as BattlePass, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattlePass&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.seasonTitle, seasonTitle) || other.seasonTitle == seasonTitle)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.level, level) || other.level == level)&&(identical(other.maxLevel, maxLevel) || other.maxLevel == maxLevel)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.xpPerLevel, xpPerLevel) || other.xpPerLevel == xpPerLevel)&&(identical(other.premiumOwned, premiumOwned) || other.premiumOwned == premiumOwned)&&(identical(other.claimDeadline, claimDeadline) || other.claimDeadline == claimDeadline)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&(identical(other.promo, promo) || other.promo == promo)&&const DeepCollectionEquality().equals(other.levels, levels)&&const DeepCollectionEquality().equals(other.quests, quests)&&const DeepCollectionEquality().equals(other.pendingRewards, pendingRewards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seasonId,seasonTitle,endsAt,level,maxLevel,xp,xpPerLevel,premiumOwned,claimDeadline,selectedLevel,promo,const DeepCollectionEquality().hash(levels),const DeepCollectionEquality().hash(quests),const DeepCollectionEquality().hash(pendingRewards));

@override
String toString() {
  return 'BattlePass(seasonId: $seasonId, seasonTitle: $seasonTitle, endsAt: $endsAt, level: $level, maxLevel: $maxLevel, xp: $xp, xpPerLevel: $xpPerLevel, premiumOwned: $premiumOwned, claimDeadline: $claimDeadline, selectedLevel: $selectedLevel, promo: $promo, levels: $levels, quests: $quests, pendingRewards: $pendingRewards)';
}


}

/// @nodoc
abstract mixin class $BattlePassCopyWith<$Res>  {
  factory $BattlePassCopyWith(BattlePass value, $Res Function(BattlePass) _then) = _$BattlePassCopyWithImpl;
@useResult
$Res call({
 int seasonId, String seasonTitle, int endsAt, int level, int maxLevel, int xp, int xpPerLevel, bool premiumOwned, int claimDeadline, int selectedLevel, Promo promo, List<Level> levels, List<Quest> quests, List<Reward> pendingRewards
});


$PromoCopyWith<$Res> get promo;

}
/// @nodoc
class _$BattlePassCopyWithImpl<$Res>
    implements $BattlePassCopyWith<$Res> {
  _$BattlePassCopyWithImpl(this._self, this._then);

  final BattlePass _self;
  final $Res Function(BattlePass) _then;

/// Create a copy of BattlePass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seasonId = null,Object? seasonTitle = null,Object? endsAt = null,Object? level = null,Object? maxLevel = null,Object? xp = null,Object? xpPerLevel = null,Object? premiumOwned = null,Object? claimDeadline = null,Object? selectedLevel = null,Object? promo = null,Object? levels = null,Object? quests = null,Object? pendingRewards = null,}) {
  return _then(BattlePass(
seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as int,seasonTitle: null == seasonTitle ? _self.seasonTitle : seasonTitle // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,maxLevel: null == maxLevel ? _self.maxLevel : maxLevel // ignore: cast_nullable_to_non_nullable
as int,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,xpPerLevel: null == xpPerLevel ? _self.xpPerLevel : xpPerLevel // ignore: cast_nullable_to_non_nullable
as int,premiumOwned: null == premiumOwned ? _self.premiumOwned : premiumOwned // ignore: cast_nullable_to_non_nullable
as bool,claimDeadline: null == claimDeadline ? _self.claimDeadline : claimDeadline // ignore: cast_nullable_to_non_nullable
as int,selectedLevel: null == selectedLevel ? _self.selectedLevel : selectedLevel // ignore: cast_nullable_to_non_nullable
as int,promo: null == promo ? _self.promo : promo // ignore: cast_nullable_to_non_nullable
as Promo,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as List<Level>,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as List<Quest>,pendingRewards: null == pendingRewards ? _self.pendingRewards : pendingRewards // ignore: cast_nullable_to_non_nullable
as List<Reward>,
  ));
}
/// Create a copy of BattlePass
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromoCopyWith<$Res> get promo {
  
  return $PromoCopyWith<$Res>(_self.promo, (value) {
    return _then(_self.copyWith(promo: value));
  });
}
}


/// Adds pattern-matching-related methods to [BattlePass].
extension BattlePassPatterns on BattlePass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattlePass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattlePass() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattlePass value)  $default,){
final _that = this;
switch (_that) {
case _BattlePass():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattlePass value)?  $default,){
final _that = this;
switch (_that) {
case _BattlePass() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seasonId,  String seasonTitle,  int endsAt,  int level,  int maxLevel,  int xp,  int xpPerLevel,  bool premiumOwned,  int claimDeadline,  int selectedLevel,  Promo promo,  List<Level> levels,  List<Quest> quests,  List<Reward> pendingRewards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattlePass() when $default != null:
return $default(_that.seasonId,_that.seasonTitle,_that.endsAt,_that.level,_that.maxLevel,_that.xp,_that.xpPerLevel,_that.premiumOwned,_that.claimDeadline,_that.selectedLevel,_that.promo,_that.levels,_that.quests,_that.pendingRewards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seasonId,  String seasonTitle,  int endsAt,  int level,  int maxLevel,  int xp,  int xpPerLevel,  bool premiumOwned,  int claimDeadline,  int selectedLevel,  Promo promo,  List<Level> levels,  List<Quest> quests,  List<Reward> pendingRewards)  $default,) {final _that = this;
switch (_that) {
case _BattlePass():
return $default(_that.seasonId,_that.seasonTitle,_that.endsAt,_that.level,_that.maxLevel,_that.xp,_that.xpPerLevel,_that.premiumOwned,_that.claimDeadline,_that.selectedLevel,_that.promo,_that.levels,_that.quests,_that.pendingRewards);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seasonId,  String seasonTitle,  int endsAt,  int level,  int maxLevel,  int xp,  int xpPerLevel,  bool premiumOwned,  int claimDeadline,  int selectedLevel,  Promo promo,  List<Level> levels,  List<Quest> quests,  List<Reward> pendingRewards)?  $default,) {final _that = this;
switch (_that) {
case _BattlePass() when $default != null:
return $default(_that.seasonId,_that.seasonTitle,_that.endsAt,_that.level,_that.maxLevel,_that.xp,_that.xpPerLevel,_that.premiumOwned,_that.claimDeadline,_that.selectedLevel,_that.promo,_that.levels,_that.quests,_that.pendingRewards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _BattlePass extends BattlePass {
  const _BattlePass({this.seasonId = 0, this.seasonTitle = '', this.endsAt = 0, this.level = 0, this.maxLevel = 0, this.xp = 0, this.xpPerLevel = 0, this.premiumOwned = false, this.claimDeadline = 0, this.selectedLevel = 1, this.promo = const Promo(), this.levels = const <Level>[], this.quests = const <Quest>[], this.pendingRewards = const <Reward>[]}): super._();
  factory _BattlePass.fromJson(Map<String, dynamic> json) => _$BattlePassFromJson(json);

/// id of the season
@override@JsonKey() final  int seasonId;
/// season heading in the info bar, e.g. "Дай пять!"
@override@JsonKey() final  String seasonTitle;
/// unix time the season ends at; drives the info bar timer
@override@JsonKey() final  int endsAt;
/// current level — the number inside the ring
@override@JsonKey() final  int level;
/// last level of the season
@override@JsonKey() final  int maxLevel;
/// experience gained inside the current level
@override@JsonKey() final  int xp;
/// experience needed for the next level; xp/xpPerLevel fills the ring
@override@JsonKey() final  int xpPerLevel;
/// whether the premium track is owned — the main state switch
@override@JsonKey() final  bool premiumOwned;
/// season is over but rewards are still claimable until this unix time
@override@JsonKey() final  int claimDeadline;
/// which level is opened in the middle of the screen
@override@JsonKey() final  int selectedLevel;
/// right-hand promo panel
@override@JsonKey() final  Promo promo;
/// the reward track
@override@JsonKey() final  List<Level> levels;
/// quests for the second screen and the preview card
@override@JsonKey() final  List<Quest> quests;
/// rewards waiting to be collected, gathered at the head of the track
///
/// Kept apart from [levels] because the mockup numbers the level pins 1, 2,
/// 3 … without a break while these carry no pin at all. They are not tied
/// to the pass either: the same cluster and its "collect all" bar are drawn
/// whether or not the premium is owned.
@override@JsonKey() final  List<Reward> pendingRewards;

/// Create a copy of BattlePass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattlePassCopyWith<_BattlePass> get copyWith => __$BattlePassCopyWithImpl<_BattlePass>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattlePass&&(identical(other.seasonId, seasonId) || other.seasonId == seasonId)&&(identical(other.seasonTitle, seasonTitle) || other.seasonTitle == seasonTitle)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.level, level) || other.level == level)&&(identical(other.maxLevel, maxLevel) || other.maxLevel == maxLevel)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.xpPerLevel, xpPerLevel) || other.xpPerLevel == xpPerLevel)&&(identical(other.premiumOwned, premiumOwned) || other.premiumOwned == premiumOwned)&&(identical(other.claimDeadline, claimDeadline) || other.claimDeadline == claimDeadline)&&(identical(other.selectedLevel, selectedLevel) || other.selectedLevel == selectedLevel)&&(identical(other.promo, promo) || other.promo == promo)&&const DeepCollectionEquality().equals(other.levels, levels)&&const DeepCollectionEquality().equals(other.quests, quests)&&const DeepCollectionEquality().equals(other.pendingRewards, pendingRewards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seasonId,seasonTitle,endsAt,level,maxLevel,xp,xpPerLevel,premiumOwned,claimDeadline,selectedLevel,promo,const DeepCollectionEquality().hash(levels),const DeepCollectionEquality().hash(quests),const DeepCollectionEquality().hash(pendingRewards));

@override
String toString() {
  return 'BattlePass(seasonId: $seasonId, seasonTitle: $seasonTitle, endsAt: $endsAt, level: $level, maxLevel: $maxLevel, xp: $xp, xpPerLevel: $xpPerLevel, premiumOwned: $premiumOwned, claimDeadline: $claimDeadline, selectedLevel: $selectedLevel, promo: $promo, levels: $levels, quests: $quests, pendingRewards: $pendingRewards)';
}


}

/// @nodoc
abstract mixin class _$BattlePassCopyWith<$Res> implements $BattlePassCopyWith<$Res> {
  factory _$BattlePassCopyWith(_BattlePass value, $Res Function(_BattlePass) _then) = __$BattlePassCopyWithImpl;
@override @useResult
$Res call({
 int seasonId, String seasonTitle, int endsAt, int level, int maxLevel, int xp, int xpPerLevel, bool premiumOwned, int claimDeadline, int selectedLevel, Promo promo, List<Level> levels, List<Quest> quests, List<Reward> pendingRewards
});


@override $PromoCopyWith<$Res> get promo;

}
/// @nodoc
class __$BattlePassCopyWithImpl<$Res>
    implements _$BattlePassCopyWith<$Res> {
  __$BattlePassCopyWithImpl(this._self, this._then);

  final _BattlePass _self;
  final $Res Function(_BattlePass) _then;

/// Create a copy of BattlePass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seasonId = null,Object? seasonTitle = null,Object? endsAt = null,Object? level = null,Object? maxLevel = null,Object? xp = null,Object? xpPerLevel = null,Object? premiumOwned = null,Object? claimDeadline = null,Object? selectedLevel = null,Object? promo = null,Object? levels = null,Object? quests = null,Object? pendingRewards = null,}) {
  return _then(_BattlePass(
seasonId: null == seasonId ? _self.seasonId : seasonId // ignore: cast_nullable_to_non_nullable
as int,seasonTitle: null == seasonTitle ? _self.seasonTitle : seasonTitle // ignore: cast_nullable_to_non_nullable
as String,endsAt: null == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,maxLevel: null == maxLevel ? _self.maxLevel : maxLevel // ignore: cast_nullable_to_non_nullable
as int,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,xpPerLevel: null == xpPerLevel ? _self.xpPerLevel : xpPerLevel // ignore: cast_nullable_to_non_nullable
as int,premiumOwned: null == premiumOwned ? _self.premiumOwned : premiumOwned // ignore: cast_nullable_to_non_nullable
as bool,claimDeadline: null == claimDeadline ? _self.claimDeadline : claimDeadline // ignore: cast_nullable_to_non_nullable
as int,selectedLevel: null == selectedLevel ? _self.selectedLevel : selectedLevel // ignore: cast_nullable_to_non_nullable
as int,promo: null == promo ? _self.promo : promo // ignore: cast_nullable_to_non_nullable
as Promo,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as List<Level>,quests: null == quests ? _self.quests : quests // ignore: cast_nullable_to_non_nullable
as List<Quest>,pendingRewards: null == pendingRewards ? _self.pendingRewards : pendingRewards // ignore: cast_nullable_to_non_nullable
as List<Reward>,
  ));
}

/// Create a copy of BattlePass
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromoCopyWith<$Res> get promo {
  
  return $PromoCopyWith<$Res>(_self.promo, (value) {
    return _then(_self.copyWith(promo: value));
  });
}
}

// dart format on
