// import 'package:flutter/material.dart';
//  import 'package:razorpay_flutter/razorpay_flutter.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//    late Razorpay razorpay;
//   final TextEditingController amount=TextEditingController();
//  final _formKey=GlobalKey<FormState>();

//  @override
//   void initState() {
//     super.initState();
//     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//    @override
//   void dispose() {
//     super.dispose();
//      razorpay.clear();
//   }

//   void openLaunch(){
//     var options={
//      " Key":"rzp_test_cI8bT3ic4CXrKH",
//       "amount":amount.text,
//       "name":'Vivek Yadav',
//       "prefill":{
//         'contect':'9205157658',
//         'email':'vivek.yadav@sapple.co.in'
//       },
//       "external":{
//         "wallets":["paytm"]
//       }   
//     };
//     try{
//     razorpay.open(options);
//     }catch(e){
//       print(e.toString());
//     }
//   }
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print('Success Response: $response');
   
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     print('Error Response: $response');
    
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print('External SDK Response: $response');
   
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Money"),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//            Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: TextFormField(
//               controller: amount,
//               keyboardType:TextInputType.number ,
//               decoration: InputDecoration(
//                 hintText: "Add amount",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10))
//               ),
//              ),
//            ),
//             const SizedBox(
//               height: 20,
//             ),
//             RaisedButton(
//               color: Colors.blue,
//               onPressed: () {
//                 if(_formKey.currentState!.validate()){
//                    openLaunch();
//                 }
//               },
//               child: const Text("Pay Now"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
