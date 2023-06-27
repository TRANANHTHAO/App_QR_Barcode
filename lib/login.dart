import 'package:appcheckqr/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'Auth_service.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  AuthService authService = AuthService();
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 236, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 100),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://cdn.pixabay.com/photo/2021/06/12/21/33/qr-code-6331792_1280.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: authService.email,
                  decoration: InputDecoration(

                    labelText: "E-Mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value){
                    //bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~] + @[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                    if (value!.isEmpty || value == null) {
                      return 'Empty Email';
                    }
                    else if(!value.contains('@')){
                      return 'Email Invalidate Format';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: authService.password,
                  obscureText: passToggle,
                  decoration: InputDecoration(

                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),

                    suffix:  InkWell(
                      onTap: (){
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(passToggle ? Icons.visibility_off : Icons.visibility),
                    )
                  ),
                  validator: (value){
                    if (value == null || value!.isEmpty) {
                      return 'Empty Password';
                    }
                    else if(value.length < 6){
                      return 'Password Must Be More Than 6';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 85),
                  ),
                  onPressed: () {

                    if (_formfield.currentState!.validate()) {
                      authService.LoginUser(context);
                    }
                  },
                  child: const Text("Log In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?",
                      style: TextStyle(
                      fontSize: 16,
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
