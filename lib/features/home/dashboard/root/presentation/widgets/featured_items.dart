part of '../pages/home_page.dart';

class FeaturedItems extends ConsumerStatefulWidget {
  const FeaturedItems({super.key});

  @override
  ConsumerState<FeaturedItems> createState() => _FeaturedItemsState();
}

class _FeaturedItemsState extends ConsumerState<FeaturedItems> {
  @override
  void initState() {
    super.initState();
    Future((){
      ref.read(featuredProductNotifierProvider.notifier).fetchFeaturedProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(featuredProductNotifierProvider);

    if (state.status == Status.loading) {
      return const CircularProgressIndicator();
    } else if (state.status == Status.success) {
      Log.debug('Success');
      final List<FeaturedModel> featuredModels = state.data;

      return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        height: 250,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: featuredModels.length,
          itemBuilder: (BuildContext context, int index) {
            final entry = featuredModels[index];
            return Container(
              height: 242,
              width: 156,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                top: 5,
                right: 5,
                left: 5,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display the key
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        context.push('/product-details', extra: entry);
                      },
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
                            'product name',
                            style: AppTextStyle.textStyleOne(
                              Colors.black,
                              14,
                              FontWeight.w600,
                            ),
                          ),
                          Text(
                            entry.price.toString(),
                            style: AppTextStyle.textStyleOne(
                              const Color(0xffFE3A30),
                              14,
                              FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
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
                              const Flexible(
                                flex: 3,
                                child: Text(
                                  '2 Reviews',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    HapticFeedback.heavyImpact();
                                    DialogHelper.actionPopPup(
                                      context,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.more_vert_outlined,
                                    color: Color(0xffFFC120),
                                    size: 15,
                                  ),
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
      return  Center(
        child: Text(state.data.toString()),
      );
    }
  }
}
