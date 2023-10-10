import 'package:core/core.dart';

import 'package:ecommerce_module/features/home/dashboard/root/data/data_sources/category_product_items_data_source.dart';

class CategoryProductItemDataSourceImpl
    implements CategoryProductItemDataSource{
  CategoryProductItemDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> categoryItems() async {
    final response = await client.get(
      APIType.public,
      API.categoryItems,
    );
    return response;
  }
}
