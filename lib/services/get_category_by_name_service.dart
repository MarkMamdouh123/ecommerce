import 'dart:convert';

import 'package:ecommerce/models/product_model.dart';
import 'package:http/http.dart' as http;

import '../helper/api.dart';

class GetCategoryByNameService {
  Future<List<ProductModel>> getCategoriesByName(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> product = data
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();
    return product;
  }
}
