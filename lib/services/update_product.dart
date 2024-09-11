import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {String? title,
      String? category,
      String? image,
      String? des,
      int? id,
      num? price}) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      ' title': title,
      'id': id,
      ' price': des,
      'description': des,
      'category': category,
      'image': image,
    });
    print(data);
    return ProductModel.fromJson(data);
  }
}
