import 'package:cosmetic/productsloreal.dart';
import 'package:flutter/material.dart';

class productsdetails extends StatelessWidget {
  final assetPath, productprice, productsname;

  productsdetails({this.assetPath, this.productprice, this.productsname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 227, 132, 164),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, 'homescreen');
          },
        ),
        title: Text(
          'pickup',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Products',
                style: TextStyle(
                    fontSize: 43,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 244, 120, 161)),
              )),
          SizedBox(
            height: 20,
          ),
          Hero(
            tag: assetPath,
            child: Image.asset(
              assetPath,
              height: 150,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Text(
              productprice,
              style: TextStyle(
                  fontSize: 22, color: Color.fromARGB(255, 245, 127, 166)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              productsname,
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(255, 245, 127, 166)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                'Healthy Shine Skin Every Time  Starts From WithIn.Take Time and Your Skin Happy Amazing Product.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 245, 127, 166)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 248, 145, 180)),
              child: Center(
                child: Text(
                  'Book Now',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
