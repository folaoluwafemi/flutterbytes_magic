import 'package:flutter/material.dart';
import 'package:flutterbytes_magic/src/entities/app/theme/app_theme.dart';
import 'package:flutterbytes_magic/src/entities/magic/magic_text.dart';

class MagicPage extends StatefulWidget {
  const MagicPage({Key? key}) : super(key: key);

  @override
  State<MagicPage> createState() => _MagicPageState();
}

class _MagicPageState extends State<MagicPage> {
  final ValueNotifier<Offset> mousePositionNotifier = ValueNotifier<Offset>(
    Offset.zero,
  );

  @override
  void dispose() {
    mousePositionNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return MouseRegion(
                  onHover: (event) {
                    if (event.position.dx < constraints.maxWidth &&
                        event.position.dy < constraints.maxHeight &&
                        event.position.dx > 0 &&
                        event.position.dy > 0) {
                      mousePositionNotifier.value = event.position;
                    }
                  },
                  child: MagicText(
                    text: 'FlutterBytes',
                    constraints: constraints.biggest.bottomRight(Offset.zero),
                    mousePositionNotifier: mousePositionNotifier,
                  ),
                );
              },
            ),
            Text(
              'Community',
              style: textTheme.bodySmall?.copyWith(
                fontSize: 160,
                height: 1,
                letterSpacing: -14.5,
                color: AppColors.darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
