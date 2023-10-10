part of '../pages/home_page.dart';

class CategoryProductItems extends ConsumerStatefulWidget {
  const CategoryProductItems({super.key});

  @override
  ConsumerState<CategoryProductItems> createState() =>
      _CategoryProductItemsState();
}

class _CategoryProductItemsState extends ConsumerState<CategoryProductItems> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(categoryItemNotifierProvider.notifier).fetchCategoryItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryItemNotifierProvider);

    if (state.status == Status.success) {
      final List<String> categoryItems = state.data;

      return SizedBox(
        height: 120,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                HapticFeedback.heavyImpact();
                context.go(
                    '/${Routers.homeRoot}/category-details/${categoryItems[index]}',);
              },
              child: Container(
                height: 100,
                width: 120,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5, right: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display the key
                    SizedBox(
                      height: 58,
                      width: 58,
                      child: Image.asset(
                        'images/home_page_icons/category_icons/fashion.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(child: Text(
                      categoryItems[index],
                      style: AppTextStyle.smallTextOne,
                    ),), // Display the corresponding image
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const Icon(Icons.error_outline);
    }
  }
}
