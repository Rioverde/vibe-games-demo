// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_pass_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattlePassState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattlePassState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattlePassState()';
}


}

/// @nodoc
class $BattlePassStateCopyWith<$Res>  {
$BattlePassStateCopyWith(BattlePassState _, $Res Function(BattlePassState) __);
}


/// Adds pattern-matching-related methods to [BattlePassState].
extension BattlePassStatePatterns on BattlePassState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BattlePassLoading value)?  loading,TResult Function( BattlePassLoaded value)?  loaded,TResult Function( BattlePassError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BattlePassLoading() when loading != null:
return loading(_that);case BattlePassLoaded() when loaded != null:
return loaded(_that);case BattlePassError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BattlePassLoading value)  loading,required TResult Function( BattlePassLoaded value)  loaded,required TResult Function( BattlePassError value)  error,}){
final _that = this;
switch (_that) {
case BattlePassLoading():
return loading(_that);case BattlePassLoaded():
return loaded(_that);case BattlePassError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BattlePassLoading value)?  loading,TResult? Function( BattlePassLoaded value)?  loaded,TResult? Function( BattlePassError value)?  error,}){
final _that = this;
switch (_that) {
case BattlePassLoading() when loading != null:
return loading(_that);case BattlePassLoaded() when loaded != null:
return loaded(_that);case BattlePassError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( BattlePass pass,  BattlePassScenario scenario,  bool busy)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BattlePassLoading() when loading != null:
return loading();case BattlePassLoaded() when loaded != null:
return loaded(_that.pass,_that.scenario,_that.busy);case BattlePassError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( BattlePass pass,  BattlePassScenario scenario,  bool busy)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case BattlePassLoading():
return loading();case BattlePassLoaded():
return loaded(_that.pass,_that.scenario,_that.busy);case BattlePassError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( BattlePass pass,  BattlePassScenario scenario,  bool busy)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case BattlePassLoading() when loading != null:
return loading();case BattlePassLoaded() when loaded != null:
return loaded(_that.pass,_that.scenario,_that.busy);case BattlePassError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class BattlePassLoading implements BattlePassState {
  const BattlePassLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattlePassLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattlePassState.loading()';
}


}




/// @nodoc


class BattlePassLoaded implements BattlePassState {
  const BattlePassLoaded({required this.pass, required this.scenario, this.busy = false});
  

 final  BattlePass pass;
 final  BattlePassScenario scenario;
@JsonKey() final  bool busy;

/// Create a copy of BattlePassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattlePassLoadedCopyWith<BattlePassLoaded> get copyWith => _$BattlePassLoadedCopyWithImpl<BattlePassLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattlePassLoaded&&(identical(other.pass, pass) || other.pass == pass)&&(identical(other.scenario, scenario) || other.scenario == scenario)&&(identical(other.busy, busy) || other.busy == busy));
}


@override
int get hashCode => Object.hash(runtimeType,pass,scenario,busy);

@override
String toString() {
  return 'BattlePassState.loaded(pass: $pass, scenario: $scenario, busy: $busy)';
}


}

/// @nodoc
abstract mixin class $BattlePassLoadedCopyWith<$Res> implements $BattlePassStateCopyWith<$Res> {
  factory $BattlePassLoadedCopyWith(BattlePassLoaded value, $Res Function(BattlePassLoaded) _then) = _$BattlePassLoadedCopyWithImpl;
@useResult
$Res call({
 BattlePass pass, BattlePassScenario scenario, bool busy
});


$BattlePassCopyWith<$Res> get pass;

}
/// @nodoc
class _$BattlePassLoadedCopyWithImpl<$Res>
    implements $BattlePassLoadedCopyWith<$Res> {
  _$BattlePassLoadedCopyWithImpl(this._self, this._then);

  final BattlePassLoaded _self;
  final $Res Function(BattlePassLoaded) _then;

/// Create a copy of BattlePassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pass = null,Object? scenario = null,Object? busy = null,}) {
  return _then(BattlePassLoaded(
pass: null == pass ? _self.pass : pass // ignore: cast_nullable_to_non_nullable
as BattlePass,scenario: null == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as BattlePassScenario,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of BattlePassState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattlePassCopyWith<$Res> get pass {
  
  return $BattlePassCopyWith<$Res>(_self.pass, (value) {
    return _then(_self.copyWith(pass: value));
  });
}
}

/// @nodoc


class BattlePassError implements BattlePassState {
  const BattlePassError(this.message);
  

 final  String message;

/// Create a copy of BattlePassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattlePassErrorCopyWith<BattlePassError> get copyWith => _$BattlePassErrorCopyWithImpl<BattlePassError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattlePassError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BattlePassState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $BattlePassErrorCopyWith<$Res> implements $BattlePassStateCopyWith<$Res> {
  factory $BattlePassErrorCopyWith(BattlePassError value, $Res Function(BattlePassError) _then) = _$BattlePassErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BattlePassErrorCopyWithImpl<$Res>
    implements $BattlePassErrorCopyWith<$Res> {
  _$BattlePassErrorCopyWithImpl(this._self, this._then);

  final BattlePassError _self;
  final $Res Function(BattlePassError) _then;

/// Create a copy of BattlePassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BattlePassError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
