import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/productController.dart';
import 'package:mycollage/screens/produCartScreen.dart';

class ProductDetails extends StatefulWidget {
  final String? image;
  final String? price;
  final String? name;
  const ProductDetails({Key? key, this.price, this.image, this.name})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final productController = Get.put(ProductController());
  int counter = 0;
  bool isNotification = false;

  buildColors(Color color) {
    return Container(
      height: 35,
      width: 35,
      color: color,
    );
  }

  setNotifi() {
    setState(() {
      if (!isNotification) {
        isNotification = true;
      } else {
        isNotification = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: setNotifi,
            icon: (isNotification
                ? const Icon(
                    Icons.notifications,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.notifications_rounded,
                    color: Colors.white,
                  )),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Center(
                child: Container(
                    height: 150, child: Image.asset(widget.image.toString())),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Text(
              widget.name.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.price.toString(),
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Description",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    child: Wrap(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '''In the early 20th century, Eugène Paul Louis Schueller
                                         a young French chemist, developed a hair dye formula called Oréale
                                          Schueller formulated and manufactured his own products, which he then decided
                                           to sell to Parisian hairdressers. On 31 July 1919, Schueller registered
                                            his company,[5] the Société Française de Teintures Inoffensives pour Cheveux 
                                            (Safe Hair Dye Company of France). The guiding principles of the company,
                                                ''',
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 250,
                    // color: Colors.blue,
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: const Text(
                          "Size",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: 200,
                          child: Row(
                            children: [
                              for (int i = 0;
                                  i < productController.size.length;
                                  i++)
                                Container(
                                    height: 40,
                                    width: 40,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Card(
                                          color: Colors.grey.shade200,
                                          elevation: 5,
                                          child: Center(
                                              child: Text(
                                                  productController.size[i]))),
                                    )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: const Text("Quantity",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (counter > 0) {
                                    counter--;
                                  }
                                });
                              },
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.blue.shade100),
                                child: const Center(
                                  child: Text(
                                    "-",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            Text("$counter"),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (counter <= 4) {
                                    counter++;
                                  }
                                });
                              },
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.blue.shade100),
                                child: const Center(child: const Text("+")),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: const Text(
                  "Colors",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildColors(Colors.black),
                      buildColors(Colors.blue),
                      buildColors(Colors.red),
                      buildColors(Colors.grey)
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {
                          Get.to(ProductCart(
                            image: widget.image,
                            name: widget.name,
                            price: widget.price,
                          ));
                        },
                        child: const Text("Check out"))),
              ),
              const SizedBox(
                height: 150,
              )
            ],
          )
        ],
      ),
    );
  }
}
