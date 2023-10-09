part of '../pages/see_all_product_page.dart';

class SeeAllProductsSection extends ConsumerStatefulWidget {
  const SeeAllProductsSection({super.key});

  @override
  ConsumerState<SeeAllProductsSection> createState() =>
      _SeeAllProductsSectionState();
}

class _SeeAllProductsSectionState extends ConsumerState<SeeAllProductsSection> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(featuredProductNotifierProvider.notifier).fetchFeaturedProduct();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final notifier = ref.watch(featuredProductNotifierProvider.notifier);
    notifier.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final notifier = ref.watch(featuredProductNotifierProvider.notifier);

    if (notifier.scrollController.position.pixels ==
        notifier.scrollController.position.maxScrollExtent) {
      Log.debug('ScrollController called');
    } else {
      Log.debug("Don't called");
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(featuredProductNotifierProvider);
    // final notifier = ref.watch(featuredProductNotifierProvider.notifier);

    final cardWidth = ScreenUtil().screenWidth / 3.3;
    final cardHeight = ScreenUtil().screenHeight / 5.0;

    if (state.status == Status.success) {
      final List<FeaturedModel> featuredModels = state.data;

      return SizedBox(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8, // spacing between rows
            crossAxisSpacing: 8,
            childAspectRatio: cardWidth / cardHeight,
            // spacing between columns
          ),
          padding: const EdgeInsets.all(8), // padding around the grid
          itemCount:
              FeaturedProductModel.listItems.length, // total number of items
          itemBuilder: (context, index) {
            final entry = FeaturedProductModel.listItems[index];
            return Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                  width: 0.7,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display the key
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          featuredModels[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 10,
                        right: 10,
                        bottom: 5,
                      ),
                      width: double.infinity,
                      //    color: Colors.grey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            entry.name.toString(),
                            style: AppTextStyle.textStyleOne(
                              Colors.black,
                              14,
                              FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Rp. 1.500.000',
                            style: AppTextStyle.textStyleOne(
                              const Color(0xffFE3A30),
                              14,
                              FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xffFFC120),
                                      size: 15,
                                    ),
                                    Text(
                                      entry.rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Text(
                                  '${entry.review}'
                                  ' Reviews',
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              const Flexible(
                                flex: 2,
                                child: Icon(
                                  Icons.more_vert_outlined,
                                  color: Color(0xffFFC120),
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const Center(child: Icon(Icons.error_outline));
    }
  }
}
