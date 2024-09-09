import 'package:ecommerce/helper/api.dart';

import '../models/product_model.dart';

class GetAllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");
    List<ProductModel> products;
    products = data.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }
}
