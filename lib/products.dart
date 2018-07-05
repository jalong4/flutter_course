import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    String title = products[index]['title'];
    String imageUrl = products[index]['image'];

    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(imageUrl),
          Text(title),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator
                        .pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((bool delete) {
                      if (delete) {
                        deleteProduct(index);
                      }
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;

    if (products.length > 0) {
      productCard = ListView.builder(
          itemBuilder: _buildProductItem, itemCount: products.length);
    } else {
      productCard = Center(child: Text('No Product found, please add some.'));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
