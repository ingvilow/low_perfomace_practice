import 'package:flutter/material.dart';
import 'package:low_perfomace_practice/item_avatar.dart';
import 'package:low_perfomace_practice/item_model.dart';

class DetailBottomSheet extends StatelessWidget {
  final ItemModel item;

  const DetailBottomSheet({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // not optimal
    return ValueListenableBuilder<bool>(
      valueListenable: item.isFavorite,
      builder: (_, isFavorite, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ItemAvatarWidget(
              imageLink: item.imageLink,
              itemTitle: item.title,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          item.subtitle,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: isFavorite,
                    onChanged: (isChecked) =>
                        item.isFavorite.value = isChecked ?? false,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
