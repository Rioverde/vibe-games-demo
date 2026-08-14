import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo.freezed.dart';
part 'promo.g.dart';

/// The right-hand promo panel.
///
/// Before the premium is bought it sells the pass, afterwards it sells levels,
/// and at max level it goes flat. One structure with swapped copy, so the screen
/// never branches on "which panel am I showing".
@freezed
sealed class Promo with _$Promo {
  const factory Promo({
    /// heading, e.g. "Элитный пропуск"
    @Default('') String title,

    /// description under the heading
    @Default('') String subtitle,

    /// button label, e.g. "Повысить уровень"
    @Default('') String cta,

    /// asset key of the banner art
    @Default('') String art,

    /// false at max level — the button turns into a flat plate
    @Default(true) bool ctaEnabled,

    /// text of that plate, e.g. "Достигнут максимальный уровень"
    @Default('') String ctaDisabledText,

    /// show "Забрать все награды" under the button
    @Default(false) bool claimAll,
  }) = _Promo;

  factory Promo.fromJson(Map<String, dynamic> json) => _$PromoFromJson(json);

  factory Promo.mock() => const Promo(
    title: 'Элитный пропуск',
    subtitle: 'Прокачай боевой пропуск и забери четкие скины, аксессуары и многое другое!',
    cta: 'Прокачать',
    art: 'premium',
  );
}
