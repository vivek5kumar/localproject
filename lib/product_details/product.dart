
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({ Key? key }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Men's Footwear...."),
      ),
      body: GridView.extent(
        padding: EdgeInsets.all(6),
        maxCrossAxisExtent: 200,
        children: [
          Card(
            color: Colors.blueAccent,
            child: InkWell(
                onTap: (){
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
             },
              // child: Center(child: const Text('Clothing', style: TextStyle(fontSize: 20,color: Colors.white))),
              child: SizedBox(child: Image.asset('assets/images/splash.jpg'),
              ),
            ),
          ),
         Card(
           child: InkWell(
             onTap: (){
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
             },
             child: const Text('Second', style: TextStyle(fontSize: 20)),
           ),
         ),
          Card(
            child: const Text('Third', style: TextStyle(fontSize: 20)),
          ),
          Card(
            child: const Text('Four', style: TextStyle(fontSize: 20)),
          ),
          Card(
            child: const Text('Five', style: TextStyle(fontSize: 20),
            ),
          ),
          Card(
            child: const Text('Six', style: TextStyle(fontSize: 20)),
          ),
          
        ],
        )
      
    );
    }
}