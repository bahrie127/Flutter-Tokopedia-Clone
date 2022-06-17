import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/product.dart';

class ProductProvider extends ChangeNotifier {
  Future<List<Product>?> getProducts() async {
    Uri url = Uri.parse(
        'https://b30e5196-6087-4a2e-bc0b-ee4356c5b6a3.mock.pstmn.io/products');
    var result = await http.get(url);

    print(result.statusCode);
    print(result.body);

    try {
      if (result.statusCode == 200) {
        List<Product> _products = productFromJson(result.body);
        return _products;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
