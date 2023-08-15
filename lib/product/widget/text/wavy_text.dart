import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:kartal/kartal.dart';

import '../../constant/color_constants.dart';

class WavyBoldText extends StatelessWidget {
  const WavyBoldText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        WavyAnimatedText(
          title,
          textStyle: context.textTheme.headlineSmall!.copyWith(
            color: ColorConstants.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
