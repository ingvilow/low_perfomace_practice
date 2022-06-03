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
  List<ItemModel> items = [];

  @override
  void initState() {
    super.initState();
    items = widget.repository.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Low Performance App')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ValueListenableBuilder<bool>(
            valueListenable: items[index].isFavorite,
            builder: (_, isFavorite, __) {
              return ListTile(
                subtitle: Text(items[index].title),
                title: Text(items[index].subtitle),
                trailing: Checkbox(
                  value: isFavorite,
                  onChanged: (isChecked) =>
                      items[index].isFavorite.value = isChecked ?? false,
                ),
                leading: _itemAvatar(items[index]),
                onTap: () => _showDetail(context, items[index]),
              );
            },
          );
        },
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

  Widget _itemAvatar(ItemModel itemModel) {
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
