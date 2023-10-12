part of '../pages/see_all_product_page.dart';

class SeeAllProductsSearch extends ConsumerStatefulWidget {
  const SeeAllProductsSearch({
    required this.categoryName,
    required this.focusNode,
    super.key,
  });

  final String categoryName;
  final FocusNode focusNode;

  @override
  ConsumerState<SeeAllProductsSearch> createState() => _CategorySearchState();
}

class _CategorySearchState extends ConsumerState<SeeAllProductsSearch> {
  bool recentSearch = false;

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(featuredProductNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.categoryName,
            style: AppTextStyle.textStyleOne(
              Colors.black,
              24,
              FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xfffafafa),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                TextFormField(
                  focusNode: widget.focusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: Color(0xffC4C5C4),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'Search Product Name',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    prefixIcon: GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        widget.focusNode.unfocus();
                        Future.delayed(const Duration(milliseconds: 500), () {
                          DialogHelper.seeAllProductsSearchFilter(context);
                        });
                      },
                      child: const Icon(
                        Icons.menu_outlined,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        notifier.searchProducts(notifier.searchController.text);
                        setState(() {
                          // Perform search here
                          final searchTerm = notifier.searchController.text;
                          // Add the search term to recent searches
                          if (searchTerm.isNotEmpty) {
                            notifier.recentSearches.add(searchTerm);
                            notifier.searchController.clear();
                          }
                        });
                      },
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                  onEditingComplete: () {
                    setState(() {
                      final searchTerm = notifier.searchController.text;
                      // Add the search term to recent searches
                      if (searchTerm.isNotEmpty) {
                        notifier.recentSearches.add(searchTerm);
                        recentSearch = false;
                        notifier.searchController.clear();
                      } else if (searchTerm.isEmpty) {
                        notifier.searchController.clear();
                        recentSearch = false;
                      }
                    });
                  },
                  onTap: () {
                    setState(() {
                      recentSearch = !recentSearch;
                    });
                  },
                  controller: notifier.searchController,
                ),
                if (recentSearch == true)
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Recent Searches',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        ListView.builder(
                          // reverse: true,
                          shrinkWrap: true,
                          itemCount: notifier.recentSearches.length > 5
                              ? 5
                              : notifier.recentSearches.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            final reversedIndex =
                                notifier.recentSearches.length - 1 - index;
                            return SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.search,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          notifier
                                              .recentSearches[reversedIndex],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.clear,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            notifier.recentSearches.removeAt(
                                              reversedIndex,
                                            );
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(notifier.recentSearches.clear);
                            },
                            child: const Text('Clear All'),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
