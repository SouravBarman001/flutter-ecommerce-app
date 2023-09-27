part of '../pages/product_review_page.dart';

class _ProductReviewPageReviewSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: UserModel.users.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape
                              .circle, // Make the container circular
                        ),
                        child: ClipOval(
                          child: Image.network(
                            UserModel.users[index].imgUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yelena Belova',
                              style: AppTextStyle.textStyleOne(
                                Colors.black,
                                14,
                                FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              allowHalfRating: true,
                              itemSize: 20,
                              itemPadding: const EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star_outlined,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(top: 10),
                        height: double.infinity,
                        child: const Text(' 2 weeks ago'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: double.infinity,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur '
                              'adipiscing elit,'
                              ' sed do eiusmod tempor '
                              'incididunt ut labore et dolore magna aliqua.',
                          style: AppTextStyle.textStyleOne(
                            Colors.black,
                            12,
                            FontWeight.w400,
                          ),
                          maxLines: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
