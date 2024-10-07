import 'package:domi/gen/assets.gen.dart';
import 'package:domi/views/widgets/based_search_item.dart';
import 'package:flutter/material.dart';

class SearchItemWidget extends BasedSearchItem {
  final String name;
  final String subTitle;
  final VoidCallback onPressed;

  SearchItemWidget({
    super.key,
    required this.name,
    required this.subTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return withContainer(
      child: ListTile(
        title: Text(name),
        subtitle: Text(subTitle),
        leading: Assets.images.location.image(width: 30),
        shape: listTileShape,
        onTap: onPressed,
      ),
    );
  }
}
