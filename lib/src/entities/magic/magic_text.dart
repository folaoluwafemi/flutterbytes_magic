import 'package:flutter/material.dart';
import 'package:flutterbytes_magic/src/entities/app/theme/app_theme.dart';

extension on Offset {
  Offset relativeTo(Offset offset) {
    return Offset(
      dx - offset.dx,
      dy - offset.dy,
    );
  }

  Offset normalizeRelativeTo(Rect rect) {
    return Offset(
      ((dx / rect.width) * 2) - 1,
      ((dy / rect.height) * 2) - 1,
    );
  }
}

class MagicText extends StatefulWidget {
  final String text;
  final ValueNotifier<Offset> mousePositionNotifier;
  final Offset constraints;

  const MagicText({
    super.key,
    required this.text,
    required this.mousePositionNotifier,
    required this.constraints,
  });

  @override
  State<MagicText> createState() => _MagicTextState();
}

class _MagicTextState extends State<MagicText> {
  Offset? boundRelativeToScreen;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    boundRelativeToScreen = renderBox?.localToGlobal(Offset.zero);
  }

  Offset mouseRelativePosition() {
    if (boundRelativeToScreen == null) return Offset.zero;
    final Offset mousePosition = widget.mousePositionNotifier.value;
    return mousePosition.relativeTo(boundRelativeToScreen!);
  }

  @override
  Widget build(BuildContext context) {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    boundRelativeToScreen = renderBox?.localToGlobal(Offset.zero);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ValueListenableBuilder<Offset>(
      valueListenable: widget.mousePositionNotifier,
      builder: (_, offset, __) {
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            final Offset mousePosition = renderBox.globalToLocal(offset);
            final normalizedMousePosition = mousePosition.normalizeRelativeTo(
              bounds,
            );

            return RadialGradient(
              colors: const [
                AppColors.darkBlue,
                AppColors.lightBlue,
              ],
              radius: 0.5,
              center: Alignment(
                normalizedMousePosition.dx,
                normalizedMousePosition.dy,
              ),
            ).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            );
          },
          child: Text(
            widget.text,
            style: textTheme.titleLarge?.copyWith(
              height: 1,
              fontSize: 180,
              letterSpacing: -14.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
      },
    );
  }
}
