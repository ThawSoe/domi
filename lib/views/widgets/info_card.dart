import 'package:domi/views/widgets/utils/colors.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String step;
  final Widget content;
  final bool showActionButton;
  final VoidCallback? onPressedActionButton;
  final VoidCallback? onPressedBack;

  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.step,
    required this.content,
    this.showActionButton = true,
    this.onPressedActionButton,
    this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  onPressedBack?.call();
                },
                icon: const Icon(Icons.arrow_back),
                style: ButtonStyle(
                  padding: WidgetStateProperty.resolveWith(
                    (states) => EdgeInsets.zero,
                  ),
                  minimumSize: WidgetStateProperty.resolveWith(
                    (states) => Size.zero,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const Spacer(),
              Text(
                step,
                style: const TextStyle(
                    fontSize: 12, color: MColors.hightlightBlue),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
          content,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: showActionButton
                  ? () {
                      onPressedActionButton?.call();
                    }
                  : null,
              child: const Text(
                "Claim Your Address",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
