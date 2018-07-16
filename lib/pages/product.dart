import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/products/price_tag.dart';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

  Widget _buildProductDetails(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleDefault(product['title']),
                SizedBox(
                  width: 8.0,
                ),
                PriceTag(product['price']),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(product['address']),
          ),
          Divider(height: 1.0, color: Colors.grey),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(product['description']),
          ),
          Divider(height: 1.0, color: Colors.grey),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(product['title']),
        ),
        body: _buildProductDetails(context),
      ),
    );
  }
}
