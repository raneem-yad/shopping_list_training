import 'package:flutter/material.dart';
import 'package:shopping_list_training/models/grocery_item.dart';
import 'package:shopping_list_training/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _goToItemScreen() async {
    final GroceryItem addedItem = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));

    setState(() {
      _groceryItems.add(addedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: _groceryItems.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(_groceryItems[index].name),
        leading: Container(
          width: 24,
          height: 24,
          color: _groceryItems[index].category.color,
        ),
        trailing: Text(
          _groceryItems[index].quantity.toString(),
        ),
      ),
    );

    if (_groceryItems.isEmpty ){
      content = const Center(child: Text("No Gercoery were added! add a new one!"),);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _goToItemScreen();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: content,
    );
  }
}
