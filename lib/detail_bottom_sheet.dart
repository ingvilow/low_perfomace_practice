import 'package:flutter/material.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          child: Image.network(
            item.imageLink,
            cacheWidth: 110,
            cacheHeight: 110,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            trailing: ValueListenableBuilder<bool>(
              valueListenable: item.isFavorite,
              builder: (_, isFavorite, __) {
                return Checkbox(
                  value: isFavorite,
                  onChanged: (isChecked) =>
                      item.isFavorite.value = isChecked ?? false,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
