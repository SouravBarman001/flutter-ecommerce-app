class FeaturedModel {
  FeaturedModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory FeaturedModel.fromJson(Map<String, dynamic> json) => FeaturedModel(
        id: json['id'],
        title: json['title'],
        price: json['price']?.toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']),
      );

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json['rate']?.toDouble(),
        count: json['count'],
      );
  double rate;
  int count;
}
