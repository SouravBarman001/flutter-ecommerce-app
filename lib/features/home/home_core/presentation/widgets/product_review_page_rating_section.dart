part of '../pages/product_review_page.dart';

class _ProductReviewPageRatingSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: const Color(0xfffafafa),
      height: 160,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '/5',
                        style: AppTextStyle.textStyleOne(
                            Colors.black, 14, FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '86 Reviews',
                    style: AppTextStyle.textStyleOne(
                        Colors.black, 15, FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: 5,
                        minRating: 1,
                        allowHalfRating: true,
                        itemSize: 15,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 1,
                        ),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: print,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 1,
                        ),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: print,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 1,
                        ),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: 2,
                        minRating: 1,
                        allowHalfRating: true,
                        itemSize: 15,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 1,
                        ),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        allowHalfRating: true,
                        itemSize: 15,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 1,
                        ),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: LinearPercentIndicator(
                          barRadius: const Radius.circular(10),
                          lineHeight: 7,
                          percent: 0.7,
                          backgroundColor: const Color(0xffededed),
                          progressColor: const Color(0xffefb51e),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: double.infinity,
                        child: LinearPercentIndicator(
                          barRadius: const Radius.circular(10),
                          lineHeight: 7,
                          percent: 0.3,
                          backgroundColor: const Color(0xffededed),
                          progressColor: const Color(0xffefb51e),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: double.infinity,
                        child: LinearPercentIndicator(
                          barRadius: const Radius.circular(10),
                          lineHeight: 7,
                          percent: 0.4,
                          backgroundColor: const Color(0xffededed),
                          progressColor: const Color(0xffefb51e),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: double.infinity,
                        child: LinearPercentIndicator(
                          barRadius: const Radius.circular(10),
                          lineHeight: 7,
                          percent: 0.2,
                          backgroundColor: const Color(0xffededed),
                          progressColor: const Color(0xffefb51e),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: double.infinity,
                        child: LinearPercentIndicator(
                          barRadius: const Radius.circular(10),
                          lineHeight: 7,
                          percent: 0.5,
                          backgroundColor: const Color(0xffededed),
                          progressColor: const Color(0xffefb51e),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        child: Text(
                          '80',
                          style: AppTextStyle.textStyleOne(
                            const Color(0xff000000),
                            14,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        child: Text(
                          '30',
                          style: AppTextStyle.textStyleOne(
                            const Color(0xff000000),
                            14,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        child: Text(
                          '40',
                          style: AppTextStyle.textStyleOne(
                            const Color(0xff000000),
                            14,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        child: Text(
                          '20',
                          style: AppTextStyle.textStyleOne(
                            const Color(0xff000000),
                            14,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        child: Text(
                          '50',
                          style: AppTextStyle.textStyleOne(
                            const Color(0xff000000),
                            14,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
