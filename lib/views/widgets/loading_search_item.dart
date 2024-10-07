import 'package:domi/views/widgets/based_search_item.dart';
import 'package:flutter/material.dart';

class LoadingSearchItemWidget extends BasedSearchItem {
  LoadingSearchItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return withContainer(
      child: ListTile(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          ],
        ),
        shape: listTileShape,
      ),
    );
  }
}
