import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String category,
      required String image,
      required String des,
      required String price}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      ' title': title,
      ' price': des,
      'description': des,
      'category': category,
      'image': image,
    });
    return ProductModel.fromJson(data);
  }
}
