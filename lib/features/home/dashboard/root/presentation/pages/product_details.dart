part of '../pages/home_page.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({required this.data, super.key});
  final FeaturedModel data;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const ProductDetailsAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(0.7),
                  width: double.infinity,
                  height: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.data.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 10, bottom: 5),
                  height: 120,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'product-name',
                        style: AppTextStyle.textStyleOne(
                          Colors.black,
                          24,
                          FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Rp. 1.500.000',
                        style: AppTextStyle.textStyleOne(
                          const Color(0xffFE3A30),
                          16,
                          FontWeight.w600,
                        ),
                      ),
                      Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFC120),
                                  size: 18,
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              '3 Reviews',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Available : 250',
                                style: AppTextStyle.textStyleOne(
                                  const Color(0xff3A9B7A),
                                  12,
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                _ProductDetailsSellerInfoSection(),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description Product',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        16,
                        FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'The speaker unit contains a diaphragm that is '
                      'precision-grown from NAC Audio bio-cellulose, '
                      'making it stiffer, lighter and stronger than'
                      ' regular PET speaker units, and allowing the'
                      ' sound-producing diaphragm to vibrate without '
                      'the levels of distortion found in other speakers. ',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        14,
                        FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'The speaker unit contains a diaphragm that is '
                      'precision-grown from NAC Audio bio-cellulose, '
                      'making it stiffer, lighter and stronger'
                      ' than regular PET speaker units, and allowing '
                      'the sound-producing diaphragm to vibrate without'
                      ' the levels of distortion found in other speakers.',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        14,
                        FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Review (86)',
                        style: AppTextStyle.textStyleOne(
                          Colors.black,
                          16,
                          FontWeight.w700,
                        ),
                      ),
                      Row(
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const DetailsProductReview(),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    HapticFeedback.mediumImpact();
                    context.push('/product-details/product-review');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xff0C1A30),
                      ),
                    ),
                    child: Text(
                      'See All Review',
                      style: AppTextStyle.textStyleOne(
                        const Color(0xff0C1A30),
                        14,
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Product',
                      style: AppTextStyle.textStyleOne(
                        Colors.black,
                        16,
                        FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All',
                      style: AppTextStyle.textStyleOne(
                        Colors.blue,
                        16,
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const FeaturedItems(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
