import 'package:core/core.dart';

import 'package:ecommerce_module/features/home/dashboard/root/data/data_sources/featured_data_scource.dart';

class FeaturedDataSourceImpl implements FeaturedDataSource {
  FeaturedDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> featuredItems() async {
    final response = await client.get(
      APIType.public,
      API.allProducts,
    );
    return response;
  }

  @override
  Future<Response> limitItems(int limit) async {
    final response = await client.get(
      APIType.public,
      '/products?limit=$limit',
    );
    return response;
  }
}
