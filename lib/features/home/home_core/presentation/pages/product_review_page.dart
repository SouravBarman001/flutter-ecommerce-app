import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../../core/constant/text_style.dart';
import '../../data/domain/user_model.dart';

class ProductReviewPage extends StatefulWidget {
  const ProductReviewPage({super.key});

  @override
  State<ProductReviewPage> createState() => _ProductReviewPageState();
}

class _ProductReviewPageState extends State<ProductReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        shadowColor: Colors.grey.shade50,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  HapticFeedback.vibrate();
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Review Product',
                style: AppTextStyle.textStyleOne(
                  const Color(0xff000000),
                  18.0,
                  FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.star_outlined,
                            size: 22,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '4.5',
                            style: AppTextStyle.textStyleOne(
                              Colors.black,
                              16,
                              FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                              Text('/5',style: AppTextStyle.textStyleOne(Colors.black, 14, FontWeight.w400),),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('86 Reviews',style: AppTextStyle.textStyleOne(Colors.black, 15, FontWeight.w400),),
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
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  initialRating: 5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 1.0,
                                  ),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_outlined,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RatingBar.builder(
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 1.0,
                                  ),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_outlined,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 1.0,
                                  ),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_outlined,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RatingBar.builder(
                                  initialRating: 2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 1.0,
                                  ),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_outlined,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RatingBar.builder(
                                  initialRating: 1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 1.0,
                                  ),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_outlined,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                child: LinearPercentIndicator(
                                  barRadius: const Radius.circular(10),
                                  lineHeight: 7.0,
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
                                  lineHeight: 7.0,
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
                                  lineHeight: 7.0,
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
                                  lineHeight: 7.0,
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
                                  lineHeight: 7.0,
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
                                    14.0,
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
                                    14.0,
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
                                    14.0,
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
                                    14.0,
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
                                    14.0,
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
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: UserModel.users.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 70,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape
                                      .circle, // Make the container circular
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    UserModel.users[index].imgUrl.toString(),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
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
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0,
                                      ),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star_outlined,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
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
                      Container(
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
                              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
