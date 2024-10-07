import 'package:domi/views/widgets/slider.dart';
import 'package:domi/views/widgets/utils/colors.dart';
import 'package:flutter/material.dart';

class SliderBoxWidget extends StatelessWidget {
  const SliderBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Home Value: "),
        const SizedBox(
          height: 10,
        ),
        MInteractiveSlider(
          unfocusedHeight: 60,
          focusedHeight: 60,
          backgroundColor: MColors.surfaceBg,
          foregroundColor: MColors.tertiaryButtonColor,
          shapeBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.zero,
          unfocusedOpacity: 1,
          min: 0,
          max: 250,
          initialProgress: 0.5,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
