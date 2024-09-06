import 'package:flutter/material.dart';
import 'package:shopping_list_training/data/dummy_items.dart';
import 'package:shopping_list_training/widgets/new_item.dart';



class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  void _goToItemScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: (){
            _goToItemScreen(context);
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(groceryItems[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: groceryItems[index].category.color,
          ),
          trailing: Text(
            groceryItems[index].quantity.toString(),
          ),
        ),
      ),
    );
  }
}