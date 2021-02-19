import 'package:flutter/material.dart';

// Product
class Product {
  final String name;
  final String price;

  Product({this.name, this.price});
}

// Product generation
final List<Product> listItems = new List<Product>.generate(500, (i) {
  return Product(
    name: '測試資料 $i',
    price: '售價：$i',
  );
});

class MyListApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListApp"),
        ),
        body: ListHomePage(),
      ),
    );
  }
}

class ListHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.event_seat),
            title: Text('${listItems[index].name}'),
            subtitle: Text('${listItems[index].price}'),
          );
        },
      ),
    );
  }
}
