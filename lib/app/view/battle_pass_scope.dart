import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_games_demo/features/battle_pass/bloc/battle_pass_cubit/battle_pass_cubit.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';

/// Owns the battle pass cubit for the whole navigator.
///
/// Both routes render the same pass, so the cubit lives above them. It is held
/// by this state and handed down with `BlocProvider.value` rather than created
/// by the provider itself: `MaterialApp.builder` re-runs on rebuilds, and a
/// provider that owns its cubit there would close it while routes still hold a
/// reference — which surfaces as "cannot emit new states after calling close"
/// on the next tap.
class BattlePassScope extends StatefulWidget {
  const BattlePassScope({required this.child, super.key});

  final Widget child;

  @override
  State<BattlePassScope> createState() => _BattlePassScopeState();
}

class _BattlePassScopeState extends State<BattlePassScope> {
  BattlePassCubit? _cubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Built lazily because the localizations it reports errors with only exist
    // below `MaterialApp`, which is also where this scope sits.
    _cubit ??= BattlePassCubit(locale: context.l10n);
  }

  @override
  void dispose() {
    _cubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<BattlePassCubit>.value(
    value: _cubit!,
    child: widget.child,
  );
}
