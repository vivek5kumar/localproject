import 'package:get/get.dart';

class CalculatorContro extends GetxController{

    calculateTotalPerPerson(double billAmount,int splitBy,int tipPercentage){
     var totalPerPerson= (double.parse(calculateTotalTip(billAmount,splitBy,tipPercentage))+billAmount) / splitBy;
     return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int splitBy,int tipPercentage){
    double totalTip=0.0;

    if(billAmount<0 || billAmount.toString().isEmpty || billAmount==null){
      // no go!
    }else{
        totalTip= (billAmount * tipPercentage) / 100;
    }
    return totalTip.toStringAsFixed(2);
  }

}