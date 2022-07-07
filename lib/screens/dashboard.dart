import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/dropdownController.dart';
import 'package:mycollage/controllers/loginController.dart';
import 'package:mycollage/product_details/product.dart';
import 'package:mycollage/screens/add_name.dart';
import 'package:mycollage/screens/rating.dart';

import 'package:mycollage/screens/movieList.dart';

import 'package:mycollage/screens/product_check_out.dart';
import 'package:mycollage/screens/products.dart';
import 'package:mycollage/screens/profile.dart';
import 'package:mycollage/screens/searchBar.dart';
import 'package:mycollage/screens/swip_delete.dart';
import 'package:mycollage/screens/expension_pannel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> items = [
    "Slipper",
    "Sandals",
    "Sports Shoes",
    "Belts",
    "Laptops",
    "Refrigerators"
  ];
  List<int> colors = [];
  final loginController = Get.put(LoginController());
  final dropDownController = Get.put(DropDownController());
  _openDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlutterLogo(
                      size: 36,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi,${loginController.userProfiledata.name}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(
                          height: 4,
                        ),
                        Text(
                          loginController.userProfiledata.email,
                          style: TextStyle(color: Colors.white),
                        ),
                        const Divider(
                          height: 4,
                        ),
                        const Text(
                          "9205157658",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              "Calculator",
            ),
            onTap: () {
              Get.to(Rating());
            },
          ),
          const Divider(
            height: 0,
            thickness: 1,
          ),
          ListTile(
              leading: const Icon(Icons.notification_add),
              title: const Text(
                "Notification",
              ),
              onTap: () {
                Get.to(AddName());
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Dropdown()));
              }),
          const Divider(
            height: 0,
            thickness: 1,
          ),
          ListTile(
              leading: const Icon(Icons.card_giftcard),
              title: const Text("Card"),
              onTap: () {
                Get.to(CheckOut());
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
              }),
          const Divider(
            height: 0,
            thickness: 1,
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context)=>AgrCalculation()));
                Get.to(ProductMenu());
              }),
          const Divider(
            height: 0,
            thickness: 1,
          ),
          ListTile(
              leading: const Icon(Icons.details_outlined),
              title: Text("Movies"),
              onTap: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context)=>OtpLogin()));
                Get.to(MovieList());
              }),
          const Divider(
            thickness: 1,
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Do you want to delete!"),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    loginController.logout(context);
                                    Get.back();
                                  },
                                  child: Text("Ok")),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("cancle"))
                            ],
                          ),
                        ],
                      );
                      CircularProgressIndicator(color: Colors.blue,);
                    });
              }),
          const Divider(
            height: 0,
            thickness: 1,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: _openDrawer(),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text(
                "Hello,${loginController.userProfiledata.name}",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            ImageSlideshow(
              height: 120,
              initialPage: 0,

              indicatorColor: Colors.blue,

              indicatorBackgroundColor: Colors.grey,

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Get.to(MonthPage());
                      },
                      child: Image.asset(
                        'assets/images/splash.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      'assets/images/splash.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      'assets/images/marceedz.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      'assets/images/cloth.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      'assets/images/cloth.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],

              onPageChanged: (value) {
                print('Page changed: $value');
              },
              autoPlayInterval: 3000,

              /// Loops back to first slide.
              isLoop: true,
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Recently Viewed Store",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: Flexible(
                        flex: 2,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      colors.clear();
                                      colors.add(index);
                                      // Get.to(Profile());
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: colors.contains(index)
                                              ? Colors.blue
                                              : Colors.red,
                                          border: Border.all(),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0))),
                                      width: 130,
                                      child: Center(child: Text(items[index]))),
                                ),
                              );
                            })),
                  )
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sponsored",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          'assets/images/cloth.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(310, 0, 0, 0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.navigate_next),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sponsored",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          'assets/images/cloth.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(310, 0, 0, 0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.navigate_next),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(237, 35, 10, 35),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(Product());
                    },
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("View all"),
                        InkWell(
                            onTap: () {
                              //  Get.to(Product());
                            },
                            child: Icon(Icons.navigate_next))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
