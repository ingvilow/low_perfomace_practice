import 'package:flutter/cupertino.dart';

class ItemModel {
  final int id;
  final String title;
  final String subtitle;
  final String imageLink;

  final isFavorite = ValueNotifier(false);

  ItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageLink,
  });
}
