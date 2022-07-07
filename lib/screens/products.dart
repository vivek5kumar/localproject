import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:mycollage/screens/productList.dart';

class ProductMenu extends StatefulWidget {
  @override
  _ProductMenuState createState() => new _ProductMenuState();
}

class _ProductMenuState extends State<ProductMenu> {
  Widget appBarTitle = const Text("Product ");
  Icon actionIcon = const Icon(Icons.search);

  List<Image> images=[Image.asset('assets/images/mens_shirt.jpg',),
                       Image.asset('assets/images/watch.jpg'),
                       Image.asset('assets/images/jeans.jpg'),
                       Image.asset('assets/images/womens.jpg'),
                       Image.asset('assets/images/shoes.jpg'),
                      ];
    imageLogo(String image){
       return  CircleAvatar(
            maxRadius: 45,
            backgroundColor: Colors.white10,
            backgroundImage: AssetImage('assets/images/$image')
            );
        }
  @override
  Widget build(BuildContext context) {
    final _formKey= GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
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
                        style: TextStyle(
                          color: Colors.white,

                        ),
                        decoration:  InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon:  Icon(Icons.search,color: Colors.white),
                          hintText: "Search...",
                          hintStyle:  TextStyle(color: Colors.white)
                        ),
                      );}
                      else {
                        actionIcon = const Icon(Icons.search);
                        appBarTitle = const Text("AppBar Title");
                      }
                    });
                  } ,
               ),
            ]
      ),
        body:  ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GFCarousel(
                enableInfiniteScroll: true,
                activeIndicator: Colors.yellow,
                passiveIndicator: Colors.grey,
                initialPage: 0,
                hasPagination:true,
                items: images,
                autoPlay: true,
              ),
            ),
            Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Categorie",style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,)),
                  GestureDetector(
                    onTap: (){
                      Get.to(const ListProduct(name: "Categorie",));
                    },
                    child: const Text("View more",style: const TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,))),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            child: Row(
              children: [
               imageLogo("mens_shirt.jpg"),
               imageLogo("watch.jpg"),
               imageLogo("shoes.jpg"),
               imageLogo("jeans.jpg")
              ],
            ),
          ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Featured",style: const TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,)),
                  GestureDetector(
                    onTap: (){
                      Get.to(const ListProduct(name:"Featured" ,));
                    },
                    child: const Text("View more",style: const TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,))),
                ],
              ),
            ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                      height: 200,
                    //  color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 120,
                              width: 130,
                              child:imageLogo("cloth.jpg")
                            ),
                          ),
                          const Text("\$350.0.0",style: TextStyle(
                          fontSize: 16,color: Colors.blue),),
                          const Text("Men Shirt",style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,),),
                        ],
                      ),
                  ),
                ), 
                 Card(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all( Radius.circular(5.0))
                ),
                  height: 200,
                //  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 120,
                          width: 130,
                          child: Image.asset('assets/images/watch.jpg'),
                        ),
                      ),
                      const Text("\$3500.0.0",style:TextStyle(
                      fontSize: 16,color: Colors.blue),),
                      const Text("Men's Watch",style:  TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,),),
                    ],
                  ),
              ),
            ),
              ],
            ),
          ),
          
           Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("New Achives",style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,)),
                  GestureDetector(
                    onTap: (){
                      Get.to(const ListProduct(name: "New Achives",));
                    },
                    child: const Text("View more",style: const TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,))),
                ],
              ),
            ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                      height: 200,
                    //  color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 120,
                              width: 130,
                              child: Image.asset('assets/images/womens.jpg'),
                            ),
                          ),
                          const Text("\$350.0.0",style: const TextStyle(
                          fontSize: 16,color: Colors.blue),),
                          const Text("Men Shirt",style: const TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,),),
                        ],
                      ),
                  ),
                ),
                 
                 Card(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: const BorderRadius.all(const Radius.circular(5.0))
                ),
                  height: 200,
                //  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 120,
                          width: 130,
                          child: Image.asset('assets/images/watch1.jpg'),
                        ),
                      ),
                      const Text("\$3500.0.0",style: const TextStyle(
                      fontSize: 16,color: Colors.blue),),
                      const Text("Men's Watch",style: const TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold,),),
                    ],
                  ),
              ),
            ),
              ],
            ),
        ],
      )
      
          ],
        )
      
      ),
    );
  }
}