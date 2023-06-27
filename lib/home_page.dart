import 'package:appcheckqr/Auth_service.dart';
import 'package:appcheckqr/Button_Widget.dart';
import 'package:appcheckqr/scan_qr_page.dart';
import 'package:appcheckqr/product_history_page.dart';
import 'package:appcheckqr/utils/HiveUtils.dart';
import 'package:appcheckqr/utils/Utils.dart';

import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  // void initState() {
  //   Future(() async {
  //     // List<DataBarCode> dataJson = await Utils.readJsonFileDataBarCode();
  //     // var boxBarCode = HiveUtils.getHiveDataBarCode();
  //     for (var e in dataJson) {
  //       boxBarCode.put(e.barcode, e);
  //     }
  //     print(boxBarCode.values.first.name);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "QR CODE BARCODE",
            style: TextStyle(
              fontSize: 23,
              letterSpacing: 2,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              AuthService authService = AuthService();
              authService.LogOutUser(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              const Text(
                "WELCOME !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.network(
                'https://cdn.pixabay.com/photo/2021/06/12/21/33/qr-code-6331792_1280.png',
                height: 170,
                width: 170,
                //fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 50,
              ),
              //flatButton("Scan Code QR", const ScanScreen()),
              ButtonWidget(
                color: Colors.black,
                text: "Scan QR Code",
                onclicked: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScanScreen()));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                color: Colors.black,
                text: "History Scan",
                onclicked: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProductHistoryPage()));
                },
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigator(),
    );
  }
}
