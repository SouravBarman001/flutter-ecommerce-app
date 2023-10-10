import 'package:ecommerce_module/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../data/domain/user_model.dart';


class DetailsProductReview extends StatelessWidget {
  const DetailsProductReview({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
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
                            allowHalfRating: true,
                            itemSize: 20,
                            itemPadding: const EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: print,
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
    );
  }
}
