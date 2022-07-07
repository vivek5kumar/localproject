
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/calculatorContro.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({ Key? key }) : super(key: key);

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
final _formKey=GlobalKey<FormState>();
final calculatorContro= Get.put(CalculatorContro());
  int _tipPercentage=0;
  int _personCounter=1;
  double _billAmount=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20.5),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black 
                  // ),
                  color: Colors.purpleAccent.shade100,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person",
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blue) ,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Flexible(
                        flex: 2,
                        child: Text("\$ ${calculatorContro.calculateTotalPerPerson(_billAmount,_personCounter,_tipPercentage)}",style: TextStyle(fontSize: 34.5),)),
                    )
                  ],
                ), 
              ),
      
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val){
                        if(val!.isEmpty){
                            return "Reguired";
                        }else if(int.parse(val.toString())>=50 && int.parse(val.toString())<=1000){
                          return "";
                        }
                        else{
                          return "You can add more than 50 and less than 1000";
                        }
                      },
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration:InputDecoration(
                        prefixText: "Bill Amount :",
                        prefixIcon: Icon(Icons.attach_money)
                      ),
                      onChanged: (String value){
                          try{
                              _billAmount= double.parse(value);
                          }catch(exception){
                            _billAmount=0.0; 
                          }
                      },
                    ),
                    // for split..................
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Split :"),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if(_personCounter>1){
                                    _personCounter--;
                                  }else{
              
                                  }
                                });
                              },
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.purpleAccent
                                ),
                                child: Center(
                                  child: Text("-",style: TextStyle(fontSize: 15),),),
                              ),
                            ),
                            Text("$_personCounter"),
                           InkWell(
                             onTap: (){
                               setState(() {
                                 _personCounter++;
                               });
                             },
                             child: Container(
                               width: 30.0,
                               height: 30.0,
                               margin: EdgeInsets.all(10.0),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(7.0),
                                 color: Colors.purpleAccent
                               ),
                               child: Center(child: Text("+")),
                             ),
                           )
                          ],
                        ),
                        
                      ],
                    ),
                    // for Tip..............
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tip :",style: TextStyle(color: Colors.grey.shade700),),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(" \$ ${calculatorContro.calculateTotalTip(_billAmount,_personCounter,_tipPercentage)}",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                        // for slider...............
                        Column(
                          children: [
                            Text("$_tipPercentage%",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                            Slider(
                              min: 0,
                              max: 100,
                              divisions: 10,
                              value: _tipPercentage.toDouble(),
                               onChanged: (double value){
                                 setState(() {
                                   _tipPercentage=value.round();
                                 });
                               })
                          ],
                        )
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                child: Text("Add"),
                onPressed: (){
                    if(_formKey.currentState!.validate()){

                    }
              })
            ],
          ),
        ),
      ),
    );
  }

}