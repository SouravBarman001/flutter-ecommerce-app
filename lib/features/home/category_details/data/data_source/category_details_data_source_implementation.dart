import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/category_details/data/data_source/category_details_data_source.dart';

class CategoryDetailsDataSourceImpl extends CategoryDetailsDataSource {
  CategoryDetailsDataSourceImpl({required this.client});

  final RestClient client;

  @override
  Future<Response> categoryItems(String categoryName) async {
    final response = await client.get(
      APIType.public,
      '/products/category/$categoryName',
    );
    return response;
  }
}
