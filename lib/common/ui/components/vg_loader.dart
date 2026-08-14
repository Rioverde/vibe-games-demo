import 'package:flutter/material.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';

/// Centred spinner used while the first payload is on its way.
class VGLoader extends StatelessWidget {
  const VGLoader({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(color: context.colors.textPrimary),
  );
}
