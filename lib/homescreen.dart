import 'package:cosmetic/productdetails.dart';
import 'package:cosmetic/productsrimmel.dart';
import 'package:cosmetic/productsgarnier.dart';
import 'package:cosmetic/productsmaybelline.dart';
import 'package:cosmetic/productsloreal.dart';

import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        body: Center(
          child: (ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20),
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                'MY STORE',
                style: TextStyle(
                    fontSize: 45,
                    color: Color.fromARGB(255, 252, 167, 196),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Color.fromARGB(255, 253, 132, 164),
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45),
                unselectedLabelColor: Color.fromARGB(255, 242, 143, 176),
                tabs: [
                  Tab(
                    child: Text(
                      'LOREAL',
                      style: TextStyle(fontFamily: 'verela', fontSize: 21),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'MAYBELLINE',
                      style: TextStyle(fontFamily: 'verela', fontSize: 21),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'RIMMEL',
                      style: TextStyle(fontFamily: 'verela', fontSize: 21),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'GARNIER',
                      style: TextStyle(fontFamily: 'verela', fontSize: 21),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                width: double.infinity,
                child: TabBarView(controller: tabController, children: [
                  productsloreal(),
                  productsmaybelline(),
                  productsrimmel(),
                  productsgarnier(),
                ]),
              ),
            ],
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'homescreen');
          },
          backgroundColor: Color.fromARGB(255, 236, 127, 163),
          child: Icon(Icons.face_sharp),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          child: Container(
            height: 60,
            child: Padding(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'profile');
                    },
                    icon: Icon(Icons.person_outline),
                    iconSize: 30,
                    color: Color.fromARGB(255, 214, 135, 161),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'search');
                    },
                    icon: Icon(Icons.search),
                    iconSize: 30,
                    color: Color.fromARGB(255, 214, 135, 161),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
