import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/home_core/data/data_sources/featured_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featuredDataResourceProvider = Provider<FeaturedDataSource>((ref) {
  return FeaturedDataSourceImpl(client: ref.watch(networkProvider));
});

abstract class FeaturedDataSource {
  Future<Response> featuredItems();
}
