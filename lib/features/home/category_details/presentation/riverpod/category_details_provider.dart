import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/category_details/presentation/riverpod/category_details_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryFilteredNotifierProvider =
    NotifierProvider<CategoryDetailsNotifier, BaseState>(
  CategoryDetailsNotifier.new,
);
