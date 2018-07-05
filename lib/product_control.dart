import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final String title;
  final Function addProduct;

  ProductControl({this.title, this.addProduct});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(title),
            onPressed: () {
              addProduct({'title': 'Chocolate', 'image': 'assets/food.jpg'});
            },
          );
  }
}