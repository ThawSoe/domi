import 'package:domi/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TfLocationRedIcon extends StatelessWidget {
  const TfLocationRedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Assets.images.locationRed.image(width: 20, height: 20),
    );
  }
}
