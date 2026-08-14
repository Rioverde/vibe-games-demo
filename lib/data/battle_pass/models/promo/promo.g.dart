// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Promo _$PromoFromJson(Map<String, dynamic> json) => _Promo(
  title: json['title'] as String? ?? '',
  subtitle: json['subtitle'] as String? ?? '',
  cta: json['cta'] as String? ?? '',
  art: json['art'] as String? ?? '',
  ctaEnabled: json['cta_enabled'] as bool? ?? true,
  ctaDisabledText: json['cta_disabled_text'] as String? ?? '',
  claimAll: json['claim_all'] as bool? ?? false,
);
