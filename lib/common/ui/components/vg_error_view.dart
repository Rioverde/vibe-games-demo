import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';

/// Full-screen failure message.
class VGErrorView extends StatelessWidget {
  const VGErrorView({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.s(200)),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: context.textStyles.body.copyWith(
          color: context.colors.textPrimary.withValues(alpha: 0.7),
        ),
      ),
    ),
  );
}
