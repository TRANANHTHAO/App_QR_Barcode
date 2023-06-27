
import 'package:hive/hive.dart';

import '../models/product.dart';

class HiveUtils {

  // static Box<DataBarCode> getHiveDataBarCode() {
  //   return Hive.box("dataBarCode");
  // }

  static Box<Product> getHiveProducts() {
    return Hive.box("products");
  }

  // static Box<Product> getHiveExport() {
  //   return Hive.box("export");
  // }

  // static Box<String> getHiveGroup() {
  //   return Hive.box("group");
  // }

}