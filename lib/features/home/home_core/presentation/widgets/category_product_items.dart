
part of '../pages/home_page.dart';

class _CategoryProductItems extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ProductResource.categoryItems.length,
        itemBuilder: (BuildContext context, int index) {
          final entry = ProductResource.categoryItems.entries.elementAt(index);
          final key = entry.key;
          final value = entry.value;
          return GestureDetector(
            onTap: () {
              HapticFeedback.heavyImpact();
              context.go('/home/category-details/$key');
            },
            child: Container(
              height: 80,
              width: 80,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 5, right: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display the key
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: Image.asset(
                      'images/home_page_icons/category_icons/$value',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    key,
                    style: AppTextStyle.smallTextOne,
                  ), // Display the corresponding image
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
