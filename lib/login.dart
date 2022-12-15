// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:ui';

import 'package:cosmetic/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

// ignore: non_constant_identifier_names
Future<DataModel?> submitData(String email, String password) async {
  var response = await http.post(Uri.http('reqres.in', 'api/login'), body: {
    'email': email,
    'password': password,
  });
  var data = response.body;
  print(data);

  if (response.statusCode == 200) {
    final String responseString = response.body;
    return dataModelFromJson(responseString);
  } else
    return null;
}

class _MyloginState extends State<Mylogin> {
  late DataModel _datamodel;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(left: 35, top: 50, right: 50),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 37,
                    ),
                  ),
                )),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    left: 35,
                    right: 35),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Color.fromARGB(255, 238, 173, 195),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    controller: emailController,
                  ),
                  SizedBox(height: 30),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Color.fromARGB(255, 238, 173, 195),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String email = emailController.text;
                      String password = passwordController.text;
                      DataModel? data = await submitData(email, password);
                      setState(() {
                        _datamodel = data!;
                      });
                    },
                    child: Text('LOGIN'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 229, 123, 158),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Dont have an Account ?',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 143, 180)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 255, 143, 180)),
                          )),
                    ],
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  submitdata(String email, String password) {}
}
