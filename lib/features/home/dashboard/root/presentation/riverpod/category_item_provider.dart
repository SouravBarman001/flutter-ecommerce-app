import 'package:core/core.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/riverpod/category_item_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryItemNotifierProvider =
NotifierProvider<CategoryItemNotifier, BaseState>(
  CategoryItemNotifier.new,
);
