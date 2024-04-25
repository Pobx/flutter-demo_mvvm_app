import 'package:demo_mvvm_app/models/item_list.dart';
import 'package:demo_mvvm_app/view_models/item_list_view_model.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  ItemListViewState createState() => ItemListViewState();
}

class ItemListViewState extends State<ItemListView> {
  late ItemListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ItemListViewModel(ItemList());
  }

  void _addNewItem() {
    final data = 'Item ${_viewModel.items.length + 1}';
    _viewModel.addItem(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM Example'),
      ),
      body: ListView.builder(
        itemCount: _viewModel.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_viewModel.items[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
