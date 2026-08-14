import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_edge_fade.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';

/// Fades whatever a horizontal viewport clips.
///
/// Every scrolling row in the app ends on a hard vertical line where its
/// viewport cuts, which reads as a rendering glitch rather than as content
/// carrying on.
///
/// Both edges are driven by how much is actually hidden past them, so a fade
/// only ever means "there is more this way". A row parked at its start keeps a
/// crisp left border, and scrolling to the end brings the right one back — the
/// last card must not sit permanently dimmed when nothing follows it.
class VGScrollEdgeFade extends StatefulWidget {
  const VGScrollEdgeFade({
    required this.controller,
    required this.fade,
    required this.child,
    super.key,
  });

  final ScrollController controller;

  /// Width of the fade at its widest, in design units.
  final double fade;

  final Widget child;

  @override
  State<VGScrollEdgeFade> createState() => _VGScrollEdgeFadeState();
}

class _VGScrollEdgeFadeState extends State<VGScrollEdgeFade> {
  ({double leading, double trailing}) _fades(BuildContext context) {
    const none = (leading: 0.0, trailing: 0.0);
    if (!widget.controller.hasClients) return none;

    final position = widget.controller.position;
    if (!position.hasContentDimensions) return none;

    final width = context.s(widget.fade);
    return (
      leading: (position.pixels - position.minScrollExtent).clamp(0.0, width),
      trailing: (position.maxScrollExtent - position.pixels).clamp(0.0, width),
    );
  }

  @override
  Widget build(BuildContext context) => NotificationListener<ScrollMetricsNotification>(
    // A viewport only knows how much it hides once it has laid out, which is a
    // frame later than the first build. Listening to the controller alone is
    // not enough: it speaks when the row *moves*, so the row would open on the
    // very hard cut this widget exists to hide and only soften it once someone
    // scrolled. The metrics notification also covers the row growing or the
    // strip being resized, neither of which is a scroll either.
    onNotification: (_) {
      setState(() {});
      return false;
    },
    child: AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final fades = _fades(context);
        return VGEdgeFade(
          leftFade: fades.leading,
          rightFade: fades.trailing,
          child: child!,
        );
      },
      child: widget.child,
    ),
  );
}
