import 'package:flutter/material.dart';
import 'package:fullapp2/product/constant/color_constants.dart';
import 'package:kartal/kartal.dart';
//ben bunu private yaptığım için part ile globale aktaracam
//part of '../home_vieww.dart'; hate verdi bu yüzden privateyi kaldırıcaz

class PassiveChip extends StatelessWidget {
  const PassiveChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        "Label passive",
        style: context.textTheme.bodySmall?.copyWith(
          color: ColorConstants.white,
        ),
      ),
      backgroundColor: Colors.grey,
      padding: context.padding.low,
    );
  }
}

class ActiveChip extends StatelessWidget {
  const ActiveChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: const Text("Label active"),
      backgroundColor: ColorConstants.purplePrimary,
      padding: context.padding.low,
    );
  }
}
