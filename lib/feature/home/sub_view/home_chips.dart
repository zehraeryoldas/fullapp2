import 'package:flutter/material.dart';
import 'package:fullapp2/product/constant/color_constants.dart';
import 'package:fullapp2/product/model/tag.dart';
import 'package:kartal/kartal.dart';
//ben bunu private yaptığım için part ile globale aktaracam
//part of '../home_vieww.dart'; hate verdi bu yüzden privateyi kaldırıcaz

class PassiveChip extends StatelessWidget {
  const PassiveChip({super.key, required this.tag});
  final Tag? tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        tag?.name ?? '',
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
  const ActiveChip({super.key, required this.tag});

  final Tag? tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(tag?.name ?? ''),
      backgroundColor: ColorConstants.purplePrimary,
      padding: context.padding.low,
    );
  }
}
