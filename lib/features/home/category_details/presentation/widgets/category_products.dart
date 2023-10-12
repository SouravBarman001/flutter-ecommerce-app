part of '../pages/category_details.dart';

class _CategoryProducts extends ConsumerStatefulWidget {
  const _CategoryProducts({
    required this.categoryName,
  });
  final String categoryName;

  @override
  ConsumerState<_CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends ConsumerState<_CategoryProducts> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future(() {
      ref
          .read(categoryFilteredNotifierProvider.notifier)
          .fetchFilteredCategoryItems(widget.categoryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = ScreenUtil().screenWidth / 3.3;
    final cardHeight = ScreenUtil().screenHeight / 5.0;
    final state = ref.watch(categoryFilteredNotifierProvider);

    if (state.status == Status.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.status == Status.success) {
      final List<FeaturedModel> listItems = state.data;

      return SizedBox(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8, // spacing between rows
            crossAxisSpacing: 8,
            childAspectRatio: cardWidth / cardHeight,
          ),
          padding: const EdgeInsets.all(8), // padding around the grid
          itemCount: listItems.length, // total number of items
          itemBuilder: (context, index) {
            final entry = listItems[index];
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${widget.categoryName} - $index',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      '4',
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
      );
    } else {
      return const Center(
        child: Text('No data'),
      );
    }
  }
}
