import 'dart:io';

import 'package:appcheckqr/Auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'login.dart';
import 'models/product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(ProductAdapter());
  //Hive.registerAdapter(DataBarCodeAdapter());

  // await Hive.openBox<String>("group");
  await Hive.openBox<Product>("products");
  //await Hive.openBox<DataBarCode>("dataBarCode");
  //await Hive.openBox<Product>("export");

  ByteData data = await PlatformAssetBundle().load('assets/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(
    MyApp()
  );

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: LoginScreen(),
    );
  }
}

// class Login extends StatelessWidget {
//   AuthService authService = AuthService();
//   bool passToggle = true;
//   Login({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 198, 236, 255),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 80,
//               ),
//               Image.network(
//                 'https://cdn.pixabay.com/photo/2021/06/12/21/33/qr-code-6331792_1280.png',
//                 height: 150,
//                 width: 150,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               const Text(
//                 "Login Your Account",
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//
//               TextFormField(
//                 controller: authService.email,
//                 decoration: InputDecoration(
//                   //errorText: "Email không hợp lệ!",
//                   labelText: "E-Mail",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   prefixIcon: const Icon(
//                     Icons.email,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 validator: (text){
//                   if( text == "" || text != "@")
//                     return "E-mail inválido!";
//                 },
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               // TextField(
//               //   controller: authService.password,
//               //   decoration: InputDecoration(
//               //     //errorText: "Password không hợp lệ!",
//               //     labelText: "Password",
//               //     border: OutlineInputBorder(
//               //       borderRadius: BorderRadius.circular(10),
//               //     ),
//               //     prefixIcon: const Icon(
//               //       Icons.key,
//               //       color: Colors.blue,
//               //     ),
//               //   ),
//               //   obscureText: true,
//               // ),
//               const SizedBox(
//                 height: 40,
//               ),
//               ElevatedButton(
//                 style: TextButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(horizontal: 70),
//                 ),
//                 onPressed: () {
//                   // authService.email.text = "123@gmail.com";
//                   // authService.password.text  = "123456";
//                   if (authService.email != "" && authService.password != "") {
//
//                     authService.LoginUser(context);
//                   }
//                 },
//                 child: const Text("Login",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                       fontSize: 15,
//
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Register(),
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   "Don't have an account ? Register",
//                   style: TextStyle(
//                     letterSpacing: 1
//                 ),),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Register extends StatelessWidget {
//   AuthService authService = AuthService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 206, 237, 252),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 80,
//               ),
//               Image.network(
//                 'https://cdn.pixabay.com/photo/2021/06/12/21/33/qr-code-6331792_1280.png',
//                 height: 150,
//                 width: 150,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               const Text(
//                 "Register Your Account",
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextField(
//                 controller: authService.email,
//                 decoration: InputDecoration(
//                   labelText: "E-Mail",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   prefixIcon: const Icon(
//                     Icons.email,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 controller: authService.password,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   prefixIcon: const Icon(
//                     Icons.key,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               ElevatedButton(
//                 style: TextButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(horizontal: 70),
//                 ),
//                 onPressed: () {
//                   if (authService.email != "" && authService.password != "") {
//                     authService.RegisterUser(context);
//                   }
//                 },
//                 child: const Text("Register",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Login(),
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   "Alerady have an account ? Login",
//                   style: TextStyle(
//                       letterSpacing: 1
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
  //}
//}
