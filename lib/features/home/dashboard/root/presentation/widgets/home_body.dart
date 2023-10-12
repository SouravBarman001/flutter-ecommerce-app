part of '../pages/home_page.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});


  @override
  ConsumerState<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {


  final Map<String, String> featuredItems = {
    'Premium chair':
    'https://servex-us.com/wp-content/uploads/2019/11/3d-visualization-white-background-renderings-office-furniture-manufacturers-LP7.jpg',
    'Skin formula':
    'https://5.imimg.com/data5/SELLER/Default/2022/1/VP/OV/VN/104752620/photography-white-background-500x500.jpg',
    'Milk & Honey':
    'https://img.pixelz.com/blog/white-background-photography/product-photo-liqueur-bottle-1000.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      width: double.infinity,
      color: const Color(0xfffafafa),
      child: Column(
        children: [
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
              GestureDetector(
                onTap: (){
                  context.go(
                    '/${Routers.homeRoot}/${Routers.seeAllProducts}',);
                },
                child: Text(
                  'See All',
                  style: AppTextStyle.textStyleOne(
                    Colors.blue,
                    16,
                    FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const FeaturedItems(),
          const SizedBox(
            height: 10,
          ),

          /// Best Sellers
          BestSellers(featuredItems: featuredItems),
          const SizedBox(
            height: 10,
          ),

          NewArrival(
            featuredItems: featuredItems,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
