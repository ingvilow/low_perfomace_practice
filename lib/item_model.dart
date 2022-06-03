import 'package:flutter/cupertino.dart';

class ItemModel {
  final int id;
  final String title;
  final String subtitle;
  final String imageLink;

  ValueNotifier<bool> isFavorite = ValueNotifier(false);

  ItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageLink,
    required this.isFavorite,
  });
}
