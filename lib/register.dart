import 'package:cosmetic/userModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:http/http.dart' as http;

class Myregister extends StatefulWidget {
  const Myregister({Key? key}) : super(key: key);

  @override
  State<Myregister> createState() => _MyregisterState();
  Future<UserModel?> signupData(String email, String password) async {
    var response =
        await http.post(Uri.http('reqres.in', '/api/register'), body: {
      'email': email,
      'password': password,
    });
    var data = response.body;
    print(data);

    if (response.statusCode == 201) {
      dynamic responsedynamic = response.body;
      UserModel.fromJson(responsedynamic);
    } else {
      return null;
    }
  }
}

class _MyregisterState extends State<Myregister> {
  late UserModel _usermodel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/sign.jpg',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(left: 35, top: 70, right: 50),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Create\nAccount',
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 140, 178),
                      fontSize: 33,
                    ),
                  ),
                )),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: 35,
                    right: 35),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 248, 165, 193))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white10)),
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 248, 165, 193))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white10)),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 248, 165, 193))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white10)),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String email = emailController.text;
                      String password = passwordController.text;
                      UserModel? data = await signupData(email, password);
                      setState(() {
                        _usermodel = data!;
                      });
                    },
                    child: Text('SIGNUP'),
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
                        'Already Have an Account?',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Color.fromARGB(255, 255, 140, 179)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'homescreen');
                          },
                          child: Text(
                            'sign In',
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 255, 151, 186)),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '_____________OR_____________',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 234, 134, 167)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 255, 151, 186),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '');
                      },
                      icon: Icon(Icons.facebook_sharp),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  signupData(String email, String password) {}
}
