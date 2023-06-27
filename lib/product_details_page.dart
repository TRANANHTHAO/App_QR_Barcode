//import 'package:appcheckqr/utils/HiveUtils.dart';
import 'dart:ffi';


import 'package:appcheckqr/widgets/network_image_bytes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import 'models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product? product;

  const ProductDetailsPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthParent = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      // ),
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            "Detail Product",
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: Container(
                                    color: Color(0xffeff5f4),
                                  child: Container(
                                    color: Color(0xff1a2e35)
                                        .withOpacity(0.1),

                                    child: (product!.image == null)
                                         ? Center(
                                            child: Icon(
                                              Icons.image,
                                              color: Color(0xff1a535c)
                                                  .withOpacity(0.5),
                                            ),
                                          )
                                        : NetworkImageBytes(src: "https:${product!.image}"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getDataWidget(
                                  widthParent,
                                  "Product name",
                                  product!.name!),
                              getDataWidgetFromHTML(
                                "Description",
                                product!.description!,
                              ),
                              getDataWidget(
                                widthParent,
                                "Packing date",
                                product!.dateOfManufacture!,
                              ),
                              getDataWidget(widthParent,
                                "Expiration data",
                                product!.expirationDate!,
                              ),
                              getDataWidget(widthParent,
                                "Date time scanned",
                                product!.dateTimeScan!,
                              ),
                              getDataWidget(widthParent,
                                "Lot code",
                                product!.lotCode!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getDataWidgetFromHTML(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            bottom: 3,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: "Nunito",
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xff1a535c),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 6,
                color: Color(0xff1a535c).withOpacity(0.2),
              ),
            ],
          ),
          child: HtmlWidget(value,  textStyle : TextStyle(fontSize: 15,),),
        ),
      ],
    );
  }

  Widget getDataWidget(double width, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            bottom: 3,
          ),
          child: Text(
            title,

            style: const TextStyle(
              fontFamily: "Nunito",
              fontSize: 17,

              fontWeight: FontWeight.bold,
              color: Color(0xff1a535c),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 6,
                color: Color(0xff1a535c).withOpacity(0.2),
              ),
            ],
          ),
          height: 50,
          child: Text(
            value,
            style: TextStyle(fontSize: 15,),
          ),
          /*child: TextFormField(
            initialValue: value ?? '',
            readOnly: true,
            onChanged: (value) {},
            textInputAction: TextInputAction.next,
            key: UniqueKey(),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontFamily: "Nunito",
              fontSize: 16,
              color: ColorPalette.nileBlue,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              filled: true,
              fillColor: Colors.transparent,
              hintStyle: TextStyle(
                fontFamily: "Nunito",
                fontSize: 16,
                color: ColorPalette.nileBlue.withOpacity(0.58),
              ),
            ),
            cursorColor: ColorPalette.timberGreen,
          ),*/
        ),
      ],
    );
  }
}
