import 'package:flutter/material.dart';
import 'GameWidget.dart';
import 'package:flame/game.dart';

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

class ListPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListApp"),
        ),
        body: ListPageBody(),
      ),
    );
  }
}

class ListPageBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return GameWidget(
      game: MyGame(),
    );
    //return Text("data");
    //return Image.asset('assets/images/dog.png');
  }
}
