import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constant/text_style.dart';

class NewArrival extends StatefulWidget {
   NewArrival({super.key,required this.featuredItems});
  Map featuredItems;

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Colors.grey,
          ),
          //padding: EdgeInsets.only(left: 15,top: 5),

          child:ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:
            Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/disp/ba082b144831311.6293af8f7a9d8.png', fit: BoxFit.cover),),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Arrivals',
              style: AppTextStyle.textStyleOne(
                  Colors.black, 16.0, FontWeight.w600),
            ),
            Text(
              'See All',
              style: AppTextStyle.textStyleOne(
                  Colors.blue, 16.0, FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(top: 15,bottom: 15),
          height: 250,
          // color: Colors.lightGreen,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:widget.featuredItems.length,
            itemBuilder: (BuildContext context, int index) {
              final entry = widget.featuredItems.entries.elementAt(index);
              final key = entry.key;
              final value = entry.value;
              return GestureDetector(
                onTap: () => HapticFeedback.heavyImpact(),
                child: Container(
                  height: 242,
                  width: 156,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,

                  ),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 5, right: 5,left: 5,bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Display the key
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(value,
                                    fit: BoxFit.cover),
                              ))),
                      Expanded(
                          child: Container(
                              padding: const EdgeInsets.only(top: 5,left: 10,right: 10,bottom: 5),
                              width: double.infinity,
                              //    color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    key.toString(),
                                    style: AppTextStyle.textStyleOne(Colors.black, 14.0, FontWeight.w600),
                                  ),
                                  Text(
                                    "Rp. 1.500.000",
                                    style: AppTextStyle.textStyleOne(const Color(0xffFE3A30), 14.0, FontWeight.w700),
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible( flex: 2, child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.star,color: Color(0xffFFC120),size: 15,),
                                          Text('4.5',style: TextStyle(fontSize: 10),)
                                        ],
                                      )),
                                      Flexible( flex: 3,child:  Text('86 Reviews',style: TextStyle(fontSize: 10),)),
                                      Flexible(flex: 2,child:  Icon(Icons.more_vert_outlined,color: Color(0xffFFC120),size: 15,)),
                                    ],
                                  ),
                                ],
                              ))), // Display the corresponding image
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
