import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class apiService {
  Future getAllProducts() async {
    final allProducts = Uri.parse("https://fakestoreapi.com/products");
    final reponse = await http.get(allProducts);
    // print(reponse.statusCode);
    // print(reponse.body);
    return jsonDecode(reponse.body);
  }

  Future getOneProducts(int id) async {
    final oneProducts = Uri.parse("https://fakestoreapi.com/products/$id");
    final reponse = await http.get(oneProducts);
    // print(reponse.statusCode);
    // print(reponse.body);
    return jsonDecode(reponse.body);
  }
}
