import 'package:domi/views/widgets/based_search_item.dart';
import 'package:flutter/material.dart';

class ErrorSearchItemWidget extends BasedSearchItem {
  final String errorMessage;
  ErrorSearchItemWidget({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return withContainer(
      child: ListTile(
        title: Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        ),
        shape: listTileShape,
      ),
    );
  }
}
