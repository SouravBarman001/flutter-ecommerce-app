part of '../pages/category_details.dart';


class _CategorySearch extends StatefulWidget {
  const _CategorySearch({required this.categoryName,required this.focusNode});
  final String categoryName;
  final FocusNode focusNode;

  @override
  State<_CategorySearch> createState() => _CategorySearchState();
}

class _CategorySearchState extends State<_CategorySearch> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [];
  bool recentSearch = false;

  @override
  Widget build(BuildContext context) {
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
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          // Perform search here
                          final searchTerm =
                              _searchController.text;
                          // Add the search term to recent searches
                          if (searchTerm.isNotEmpty) {
                            _recentSearches.add(searchTerm);
                            _searchController.clear();
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
                      final searchTerm =
                          _searchController.text;
                      // Add the search term to recent searches
                      if (searchTerm.isNotEmpty) {
                        _recentSearches.add(searchTerm);
                        recentSearch = false;
                        _searchController.clear();
                      } else if (searchTerm.isEmpty) {
                        _searchController.clear();
                        recentSearch = false;
                      }
                    });
                  },
                  onTap: () {
                    setState(() {
                      recentSearch = !recentSearch;
                    });
                  },
                  controller: _searchController,
                ),
                if (recentSearch == true) Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
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
                        itemCount: _recentSearches.length > 5
                            ? 5
                            : _recentSearches.length,
                        itemBuilder: (BuildContext context,
                            int index,) {
                          final reversedIndex =
                              _recentSearches.length -
                                  1 -
                                  index;
                          return SizedBox(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.search,),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        _recentSearches[
                                        reversedIndex],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment:
                                    Alignment.centerRight,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.clear,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _recentSearches
                                              .removeAt(
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
                            setState(_recentSearches.clear);
                          },
                          child: const Text('Clear All'),
                        ),
                      ),
                    ],
                  ),
                ) else Container(),
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
