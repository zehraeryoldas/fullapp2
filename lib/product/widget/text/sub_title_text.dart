import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.textTheme.titleMedium?.copyWith(),
    ); //
  }
}
