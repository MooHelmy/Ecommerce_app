import 'dart:ffi';

import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ItemInfoViewBody extends StatefulWidget {
  const ItemInfoViewBody({super.key});

  @override
  State<ItemInfoViewBody> createState() => _ItemInfoViewBodyState();
}

class _ItemInfoViewBodyState extends State<ItemInfoViewBody> {
  int selected_Index = -1;
  String item_size = "";
  List<String> size_list = ["S", "M", "L", "XL", "2XL"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          width: double.infinity,
          height: 395,
          child: const Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/Rectangle 568.png")),
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20.0,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Price(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Size",
                        style: Styles.text17SemiBold,
                      ),
                      Text(
                        "Size Guide",
                        style: Styles.text15Regular,
                      )
                    ],
                  ),
                  Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(5, (index) {
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              selected_Index = index;
                              item_size = size_list[selected_Index];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, left: 8.0),
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: selected_Index == index
                                      ? const Color(0xFF9775FA)
                                      : const Color(0xFF6E93F4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                size_list[index],
                                style: Styles.text17SemiBold,
                              )),
                            ),
                          ),
                        );
                      })),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Description",
                    style: Styles.text17SemiBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..",
                    style: Styles.text15Regular,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Men's Printed Pullover Hoodie",
            style: Styles.text13Regular,
          ),
          Text(
            "Price",
            style: Styles.text13Regular,
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nike Club Fleece',
            style: Styles.text22SemiBold,
          ),
          Text(
            r"$99",
            style: Styles.text22SemiBold,
          )
        ],
      )
    ]);
  }
}
