import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mycollage/screens/productDetails.dart';
import 'package:mycollage/screens/singleProduct.dart';

class ListProduct extends StatefulWidget {
  final String ?name;
  const ListProduct({ Key? key ,this.name}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
    Widget appBarTitle = const Text("Product List");
    Icon actionIcon = const Icon(Icons.search);
  List productList=[
            {
             'image': 'assets/images/mens_shirt.jpg',
             'price':'\$250.0',
             'name':"Men's_shirt"
            },
             {
             'image': 'assets/images/citizen.jpg',
             'price':'\$350.50',
             'name':"Men's_watch"
             
            },
             {
             'image': 'assets/images/shoes.jpg',
             'price':'\$150.0',
             'name':"Shoes"
             
            },
             {
             'image': 'assets/images/cloth.jpg',
             'price':'\$450.0',
             'name':"Women's"
             
            },
             {
             'image': 'assets/images/jeans.jpg',
             'price':'\$250.0',
             'name':"Jeans"
             
            },
            {
             'image': 'assets/images/watch.jpg',
             'price':'\$250.0',
             'name':"Jeans"
             
            },
           
    ];
  
  @override
  Widget build(BuildContext context) {
    final _formKey= GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: true,
        // centerTitle: true,
        title:appBarTitle,
        actions: <Widget>[
           IconButton(
            icon: actionIcon,
            onPressed:(){
              setState(() {
                     if ( actionIcon.icon == Icons.search){
                      actionIcon =  const Icon(Icons.close);
                      appBarTitle = const TextField(
                        cursorColor: Colors.red,
                        style: const TextStyle(
                          color: Colors.white,

                        ),
                        decoration:  const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon:  const Icon(Icons.search,color: Colors.white),
                          hintText: "Search...",
                          hintStyle:  const TextStyle(color: Colors.white)
                        ),
                      );}
                      else {
                        actionIcon =  const Icon(Icons.search);
                        appBarTitle =  const Text("ProductList");
                      }
                    });
                  } ,
               ),
            ]
      ),
        body: ListView(
          children: [
            // Text("Hello"),
            InkWell(
              onTap: (){
                // Get.put(SingleProduct(details: productList.elementAt(0),));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 700,
                  child: GridView.count(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: [
                      for(int i=0;i<productList.length;i++)
                            InkWell(
                                onTap: () {
                                  Get.to(ProductDetails(image:productList[i]['image'],
                                  price: productList[i]['price'].toString(),name: productList[i]['name'],));
                                },
                              child: Card(
                                 child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: Image.asset(productList[i]['image'],
                                    height: 120,
                                    ),
                                  ),
                                ),
                                Text(productList[i]['price']),
                                Text(productList[i]['name'],style: const TextStyle(fontWeight: FontWeight.bold),),
                                ElevatedButton(
                                  onPressed: (){
                                   showDialog(context: context, builder: (context){
                                     return AlertDialog(
                                       title: const Text("Do you want to delete?"),
                                       actions: [
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             ElevatedButton(onPressed: (){
                                               setState(() {
                                                 deleteList(i);
                                               });
                                               Get.back();
                                             }, child: const Text("Ok")),
                                             ElevatedButton(onPressed: (){
                                               Get.back();
                                             }, child: const Text("Cancle"))
                                           ],
                                         ),
                                         
                                       ],
                                     );
                                   });
                                  }, 
                                  child: Container(
                                    width: 200,
                                    child: const Center(child: const Text("Remove"))))
                              ],
                            ),
                           ),
                         ),
                      ),   
                    ],
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
  deleteList(val){
productList.removeAt(val);
  }
}