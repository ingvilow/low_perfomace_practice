import 'package:flutter/material.dart';
import 'package:low_perfomace_practice/item_model.dart';

class AnimalAvatars extends StatelessWidget {
  final ItemModel itemModel;
  const AnimalAvatars({
    required this.itemModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CircleAvatar(
        child: Image.network(
          itemModel.imageLink,
          fit: BoxFit.cover,
          width: 100,
          height: 95,
          cacheHeight: 110,
          cacheWidth: 110,
          errorBuilder: (_, __, ___) => CircleAvatar(
            backgroundColor: Colors.black12,
            child: Text(
              itemModel.title.substring(0, 1),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
