class ProductModel {
  final int id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  ProductModel({
    required this.id,
    required this.rating,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] == null ? null : Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final num? rate;
  final int? count;

  Rating({required this.rate, required this.count});
  factory Rating.fromJson(json) {
    return Rating(rate: json['rate'], count: json['count']);
  }
}
