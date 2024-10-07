import 'package:domi/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TfLocationIcon extends StatelessWidget {
  const TfLocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Assets.images.location.image(width: 20),
    );
  }
}
