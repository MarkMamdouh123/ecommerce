import '../helper/api.dart';

class AllCategoriesService {
  Future<List<String>> getAllCategories() async {
    List<String> data =
        await Api().get(url: "https://fakestoreapi.com/products");
    List<String> getAllCategories = data.map((e) => e).toList();
    return getAllCategories;
  }
}
