import 'package:flutter/material.dart';

abstract class BasedSearchItem extends StatelessWidget {
  BasedSearchItem({super.key});

  Widget withContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.05),
      ),
      child: child,
    );
  }

  final ShapeBorder? listTileShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );
}
