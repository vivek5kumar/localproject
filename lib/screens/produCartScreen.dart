import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/screens/product_check_out.dart';
class ProductCart extends StatefulWidget {
 final String ?image;
 final String ?price;
 final String ?name;
 final String ?counter;
  const ProductCart({ Key? key,this.image,this.price,this.name,this.counter }) : super(key: key);

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          color: Colors.blue,
          onPressed: (){
            Get.to(CheckOut(image: widget.image,name: widget.name,price: widget.price,counter: widget.counter,));
          },
        child: Text("Continue"),
        ),
      ),
      appBar: AppBar(
        title: Text("Cart"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)
          )
        ],
      ),
      body: Container(
        height: 140,
        width: double.infinity,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(widget.image.toString())),
              ),
            ),
             Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name.toString()),
                  Text("Cloth"),
                  Text(widget.price.toString()),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    height: 35,
                    width: 85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    if(counter>0){
                                      counter--;
                                    }
                                  });
                                },
                                child: Center(
                                  child: Text("-",style: TextStyle(fontSize: 30),),),
                              ),
                              Text("$counter"),
                             InkWell(
                               onTap: (){
                                 setState(() {
                                   if(counter<=4){
                                     counter++;
                                   }
                                 });
                               },
                               child: Center(child: Text("+",style: TextStyle(fontSize: 20),)),
                             ),
                            ],
                          ),
                  ),
                ],
              ),
            )
                 ],
               ),
           
            ],
          ),
        ),
      ),
    );
  }
}