import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductService {
  static Future<List<Product>> loadProducts() async {
    final data = await rootBundle.loadString('assets/data/products.json');
    final List<dynamic> jsonResult = jsonDecode(data);
    return jsonResult.map((item) => Product.fromJson(item)).toList();
  }
}
