import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/product.dart';
import 'dart:convert';

import 'package:flutter_application_1/screen/product_detail_screen.dart';

class ProdctListScreen extends StatefulWidget {
  const ProdctListScreen({super.key});

  static const String routeName = '/product-list';

  @override
  State<ProdctListScreen> createState() => _ProdctListScreenState();
}

class _ProdctListScreenState extends State<ProdctListScreen> {
  List<Product> products = [];

  Future<void> readJsonFile() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final productData = await json.decode(response);

    var list = productData["items"] as List<dynamic>;

    setState(() {
      products = list.map((e) => Product.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Load Products"),
            ),
          ),
          if (products.length > 0)
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    color: Colors.greenAccent,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(products[index].name),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          products[index].price.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                        Navigator.of(context).pushNamed(
                            ProductDetailScreen.routeName,
                            arguments: jsonEncode(products[index]));
                      },
                    ),
                  );
                },
              ),
            )
          else
            Container(
              child: const Text("No products"),
            )
        ],
      ),
    );
  }
}
