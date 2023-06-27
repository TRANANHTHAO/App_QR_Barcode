//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../product_details_page.dart';
import '../utils/HiveUtils.dart';
import 'network_image_bytes.dart';


class ProductCard extends StatelessWidget {
  final Product? product;
  final bool clickable;

  const ProductCard({Key? key, this.product, this.clickable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (clickable) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                product: product,
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 6,
              color: const Color(0xff000000).withOpacity(0.06),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(

          children: [
            SizedBox(
              height: 87,
              width: 87,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    color: Color(0xffeff5f4),
                    child: NetworkImageBytes(src: "https:${product!.image}")),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.name ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 15,
                      color: Color(0xff1a2e35),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    // width: 100,
                    child: Text(
                      product!.lotCode ?? '-',
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 13,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.document_scanner,
                        size: 15,
                        color: Color(0xff1a2e35).withOpacity(0.75),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        product!.dateTimeScan ?? '-',
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 13,
                          color: Color(0xff1a2e35),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
            IconButton(
              onPressed: () {
                deleteHistoryItem(product!);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> deleteHistoryItem(Product product) async {
    var hiveProduct = HiveUtils.getHiveProducts();
    hiveProduct.delete(product.id);
  }
}
