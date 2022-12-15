import 'dart:convert';

import 'package:cosmetic/productdetails.dart';
import 'package:flutter/material.dart';

class productsmaybelline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 30,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                _buildCard('foundation', '\$3.99',
                    'assets/images/foundation.jpg', false, false, context),
                _buildCard('hairoil', '\$2.99', 'assets/images/oils.webp',
                    false, false, context),
                _buildCard('nails', '\$5.69', 'assets/images/nails.jpg', false,
                    false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
                _buildCard('fragrence', '\$6.89',
                    'assets/images/fragnence.webp', false, false, context),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgpath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => productsdetails(
                    assetPath: imgpath,
                    productprice: price,
                    productsname: name,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 198, 184, 189),
                    spreadRadius: 3,
                    blurRadius: 5)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 239, 147, 178),
                        )
                      : Icon(Icons.favorite_border,
                          color: Color.fromARGB(255, 239, 147, 178)),
                ]),
              ),
              Hero(
                tag: imgpath,
                child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgpath), fit: BoxFit.contain))),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                price,
                style: TextStyle(
                    color: Color.fromARGB(255, 227, 125, 159), fontSize: 14),
              ),
              Text(
                name,
                style: TextStyle(
                    color: Color.fromARGB(255, 227, 125, 159), fontSize: 14),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  color: Color.fromARGB(255, 181, 170, 174),
                  height: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!added) ...[
                        Icon(
                          Icons.shopping_basket,
                          color: Color.fromARGB(255, 242, 133, 169),
                          size: 12,
                        ),
                        Text(
                          'Book Now',
                          style: TextStyle(
                              color: Color.fromARGB(255, 227, 125, 159),
                              fontSize: 12),
                        )
                      ],
                      if (!added) ...[
                        Icon(
                          Icons.remove_circle_outline,
                          color: Color.fromARGB(255, 242, 133, 169),
                          size: 12,
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                              color: Color.fromARGB(255, 227, 125, 159),
                              fontSize: 12),
                        )
                      ]
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
