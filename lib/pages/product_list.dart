import 'package:flutter/material.dart';

import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final List<Map<String, dynamic>> products;
  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    if (products.length > 0) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Container(
                height: 40.0, child: Image.asset(products[index]['image'])),
            title: Text(products[index]['title']),
            subtitle: Text(products[index]['description']),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ProductEditPage(
                        updateProduct: updateProduct,
                        product: products[index],
                        productIndex: index);
                  }),
                );
              },
            ),
          );
        },
        itemCount: products.length,
      );
    } else {
      return Center(child: Text('No Products found'));
    }
  }
}
