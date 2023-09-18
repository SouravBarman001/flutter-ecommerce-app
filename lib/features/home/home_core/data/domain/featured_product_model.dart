class FeaturedProductModel {
  final String? imgUrl;
  final String? name;
  final String? rating;
  final String? review;

  FeaturedProductModel(
      {required this.imgUrl,
      required this.name,
      required this.rating,
      required this.review,});

  static final List<FeaturedProductModel> _list = [
    FeaturedProductModel(
      imgUrl:
          'https://servex-us.com/wp-content/uploads/2019/11/3d-visualization-white-background-renderings-office-furniture-manufacturers-LP7.jpg',
      name: 'Premium chair',
      rating: '5',
      review: '40',
    ),
    FeaturedProductModel(
      imgUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/1/VP/OV/VN/104752620/photography-white-background-500x500.jpg',
      name: 'Skin formula',
      rating: '4.2',
      review: '50',
    ),
    FeaturedProductModel(
      imgUrl:
          'https://img.pixelz.com/blog/white-background-photography/product-photo-liqueur-bottle-1000.jpg',
      name: 'Milk & Honey',
      rating: '4.5',
      review: '90',
    ),
  ];

  static List<FeaturedProductModel> get listItems => _list;
}
