class UserModel {
  String imgUrl;
  String name;
  int rating;
  String review;
  DateTime activeTime;

  UserModel({
    required this.imgUrl,
    required this.name,
    required this.rating,
    required this.review,
    required this.activeTime,
  });

  static List<UserModel> users = [
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&1',
      name: 'Alice',
      rating: 4,
      review:
          'Great product! I love it. The quality is outstanding, and it '
              'has made my life so much easier. I can\'t recommend it enough.',
      activeTime: DateTime(2023, 9, 21, 10, 15),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&2',
      name: 'Bob',
      rating: 5,
      review:
          'I ordered this product and was pleasantly surprised by the excellent'
              'quality and fast delivery. It exceeded my expectations, and I '
              'highly recommend it to everyone. The customer service was also '
              'exceptional, and I will definitely be a repeat customer.',
      activeTime: DateTime(2023, 9, 20, 14, 30),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&3',
      name: 'Charlie',
      rating: 3,
      review: 'It\'s decent, but could be better. The product has some good'
  ' features, but I believe there\'s room '
          'for improvement in terms of durability and design',
      activeTime: DateTime(2023, 9, 19, 16, 45),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&4',
      name: 'David',
      rating: 5,
      review: 'Impressive product! Highly recommended. I\'ve been using this'
  ' product for a while now, and it has never let me down. '
  'The build quality is top-notch, and it\'s worth every penny',
      activeTime: DateTime(2023, 9, 18, 12, 20),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&5',
      name: 'Eve',
      rating: 2,
      review: 'Not satisfied with the product quality.',
      activeTime: DateTime(2023, 9, 17, 9, 55),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&6',
      name: 'Frank',
      rating: 4,
      review: 'Good value for the price.',
      activeTime: DateTime(2023, 9, 16, 18, 10),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&7',
      name: 'Grace',
      rating: 3,
      review: 'Absolutely love it! Fantastic product. This is by far '
  'the best product I\'ve ever purchased.'
  ' It has exceeded my expectations in '
  'every way possible. I can\'t imagine life without it',
      activeTime: DateTime(2023, 9, 15, 21, 30),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&8',
      name: 'Harry',
      rating: 5,
      review: 'Absolutely love it! Fantastic product.',
      activeTime: DateTime(2023, 9, 14, 8, 45),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&9',
      name: 'Ivy',
      rating: 4,
      review: 'Happy with my purchase. Good quality.',
      activeTime: DateTime(2023, 9, 13, 13, 25),
    ),
    UserModel(
      imgUrl: 'https://source.unsplash.com/random/?Person&10',
      name: 'Jack',
      rating: 2,
      review: 'Disappointed. Product didn\'t meet expectations.'
          ' I had high hopes for this product, but unfortunately,'
          ' it didn\'t live up to them. I was disappointed '
          'with the overall performance and quality',
      activeTime: DateTime(2023, 9, 12, 17, 50),
    ),
  ];
}
