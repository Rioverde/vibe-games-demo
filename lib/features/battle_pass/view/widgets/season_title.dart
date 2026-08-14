import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';

/// The season name, filled with a gradient.
///
/// `ShaderMask` reproduces the Figma fill without baking the text into an image.
class SeasonTitle extends StatelessWidget {
  const SeasonTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) => ShaderMask(
    shaderCallback: (bounds) => LinearGradient(colors: context.colors.seasonTitleGradient).createShader(bounds),
    child: Text(
      title,
      style: context.textStyles.h1.copyWith(color: context.colors.textPrimary),
    ),
  );
}
