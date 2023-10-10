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
      ref.read(featuredProductNotifierProvider.notifier).fetchLimitProduct(
            ref.read(featuredProductNotifierProvider.notifier).limitData,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(featuredProductNotifierProvider);
    final notifier = ref.watch(featuredProductNotifierProvider.notifier);

    final cardWidth = ScreenUtil().screenWidth / 3.3;
    final cardHeight = ScreenUtil().screenHeight / 5.0;

    if (state.status == Status.success) {
      final limit = notifier.limitList;

      return ListView(
        controller: notifier.scrollController,
        children: [
          SizedBox(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: cardWidth / cardHeight,
              ),
              padding: const EdgeInsets.all(8),
              itemCount: limit.length,
              itemBuilder: (context, index) {
                final entry = limit[index];
                return Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black12,
                      width: 0.7,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              entry.image,
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
                                'test-$index',
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
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffFFC120),
                                          size: 15,
                                        ),
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      '5'
                                      ' Reviews',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Flexible(
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
          ),
        ],
      );
    } else if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const Center(child: Icon(Icons.error_outline));
    }
  }
}
