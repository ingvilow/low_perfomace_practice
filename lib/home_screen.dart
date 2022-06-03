import 'package:flutter/material.dart';
import 'package:low_perfomace_practice/detail_bottom_sheet.dart';
import 'package:low_perfomace_practice/item_avatar.dart';
import 'package:low_perfomace_practice/item_model.dart';
import 'package:low_perfomace_practice/mock_repository.dart';

class HomeScreen extends StatefulWidget {
  final MockRepository repository;

  const HomeScreen({
    required this.repository,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Iterable<ItemModel>? items;

  @override
  void initState() {
    super.initState();

    items = widget.repository.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Low Performance App')),
      body: items == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: (items ?? [])
                    .map(
                      (item) => ValueListenableBuilder<bool>(
                        valueListenable: item.isFavorite,
                        builder: (_, isFavorite, __) {
                          return ListTile(
                            trailing: Checkbox(
                              value: isFavorite,
                              onChanged: (value) =>
                                  item.isFavorite.value = value ?? false,
                            ),
                            subtitle: Text(item.subtitle),
                            title: Text(item.title),
                            leading: ClipOval(
                              child: ItemAvatarWidget(
                                imageLink: item.imageLink,
                                itemTitle: item.title,
                              ),
                            ),
                            onTap: () => _showDetail(context, item),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }

  void _showDetail(BuildContext context, ItemModel item) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DetailBottomSheet(item: item);
      },
    );
  }
}
