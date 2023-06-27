//import 'dart:math';
import 'package:appcheckqr/widgets/product_card.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

import '../utils/HiveUtils.dart';
import 'models/product.dart';

class ProductHistoryPage extends StatelessWidget {
  const ProductHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hiveProduct = HiveUtils.getHiveProducts();
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: SafeArea(
          child: Container(
            color: Color(0xffeff5f4),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 15,
                  ),
                  width: double.infinity,
                  height: 85,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              size: 35,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const Text(
                            "History Scan",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 28,
                              color: Color(0xff1a2e35),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          const Text(
                            "Products",
                            style: TextStyle(
                              color: Color(0xff1a2e35),
                              fontSize: 20,
                              fontFamily: "Nunito",
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: hiveProduct.listenable(),
                              builder: (BuildContext context,
                                  Box<Product> value, Widget? child) {
                                return ListView.builder(
                                  itemCount: value.values.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    print("Hahaha: $index");
                                    print(
                                        "Hahaha value.values.length : ${value.values.length}");
                                    return ProductCard(
                                      product: value.values.toList()[index],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
