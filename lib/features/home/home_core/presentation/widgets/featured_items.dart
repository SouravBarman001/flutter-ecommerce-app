part of '../pages/home_page.dart';

class FeaturedItems extends StatelessWidget{
  const FeaturedItems({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      height: 250,
      // color: Colors.lightGreen,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: FeaturedProductModel.listItems.length,
        itemBuilder: (BuildContext context, int index) {
          final entry = FeaturedProductModel.listItems[index];
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
                          entry.imgUrl.toString(),
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
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
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
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceEvenly,
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
                            Flexible(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  HapticFeedback.heavyImpact();
                                  DialogHelper.actionPopPup(
                                    context,);
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
  }
}
