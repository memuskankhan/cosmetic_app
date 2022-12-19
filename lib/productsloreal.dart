import 'dart:convert';

import 'package:cosmetic/productdetails.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class productsloreal extends StatelessWidget {
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
                _buildCard('LOREAL VOLUME MILLION LASHES MASCARA  EXTRA BLACK',
                    '₨ 1,819', 'assets/images/L1.webp', false, false, context),
                _buildCard('LOREAL PARADISE WATERPROOF MASCARA BLACK',
                    '₨ 1,439', 'assets/images/L2.webp', false, false, context),
                _buildCard('LOREAL LIQUID FOUNDATION – 3D/3W GOLDEN BEIGE',
                    '₨ 2,729', 'assets/images/L3.webp', false, false, context),
                _buildCard(
                    'LOREAL INFAILLIBLE 24HR FRESH WEAR FACE POWDER  – 220 SAND',
                    '₨ 2,729',
                    'assets/images/L4.webp',
                    false,
                    false,
                    context),
                _buildCard(
                    'LOREAL PARIS MATTE SIGNATURE LIQUID EYELINER – 01 INK',
                    '₨ 1,679',
                    'assets/images/L5.webp',
                    false,
                    false,
                    context),
                _buildCard(
                    'LOREAL PARIS INFALLIBLE FULL WEAR MORE THAN CONCEALER',
                    '₨ 2,029',
                    'assets/images/L6.webp',
                    false,
                    false,
                    context),
                _buildCard('LOREAL PARIS COLOR RICHE MATTE ADDICTION',
                    '₨ 1,488', 'assets/images/L7.webp', false, false, context),
                _buildCard('LOREAL INFALLIBLE LIQUID FOUNDATION', '₨ 2,828',
                    'assets/images/L8.webp', false, false, context),
                _buildCard('LOREAL INFALLIBLE CONCEALER-FULL COVERAGE CASHEW',
                    '₨ 2,173', 'assets/images/L9.webp', false, false, context),
                _buildCard('LOREAL LINER SIGNATURE LIQUID EYELINER', '₨ 1,679',
                    'assets/images/L10.webp', false, false, context),
                _buildCard('LOREAL OIL KILLER POWDER 128 NATURAL BUFF',
                    '₨ 1,329', 'assets/images/L11.webp', false, false, context),
                _buildCard('fLOREAL GELCRAYON-01?BACK EYE PENCIL WATERPROOF',
                    '₨ 1,019', 'assets/images/L12.webp', false, false, context),
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
