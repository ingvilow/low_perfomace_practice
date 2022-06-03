import 'package:flutter/material.dart';
import 'package:low_perfomace_practice/animal_avatars.dart';
import 'package:low_perfomace_practice/detail_bottom_sheet.dart';
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
          return ListTile(
            subtitle: Text(items[index].title),
            title: Text(items[index].subtitle),
            leading: AnimalAvatars(
              itemModel: items[index],
            ),
            onTap: () => _showDetail(context, items[index]),
            trailing: ValueListenableBuilder<bool>(
              valueListenable: items[index].isFavorite,
              builder: (_, isFavorite, __) {
                return Checkbox(
                  value: isFavorite,
                  onChanged: (isChecked) =>
                      items[index].isFavorite.value = isChecked ?? false,
                );
              },
            ),
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
}
