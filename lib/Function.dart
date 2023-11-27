import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class function extends ChangeNotifier {
  List<String> transactions = [];

  int incomeAmount = 0;
  int expensAmount = 0;
  int mainbalance = 0;

  Future<void> incomeadd(int aaa) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("incSav", incomeAmount += aaa);
    await prefs.setInt("SavBalance", mainbalance += aaa);
    notifyListeners();

    // incomeAmount += aaa;
    // mainbalance += aaa;
  }

  void expAdd(int yyy) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("SavBalance", mainbalance -= yyy);
    await prefs.setInt("SavExp", expensAmount += yyy);
    notifyListeners();

    //  expensAmount += yyy;
    //  mainbalance -= yyy;
  }


  String? dropdownValue0;
  oprator0(newValue){
    dropdownValue0=newValue;

   notifyListeners();
  }
  String? dropdownValue1;
  oprator1(value) {
    dropdownValue1 = value;

    notifyListeners();
  }

  String? dropdownValue2;
  oprator2(value) {
    dropdownValue2 = value;

    notifyListeners();
  }
  
  String? dropdownValue3;
  operator3(value) {
    dropdownValue3 = value;

    notifyListeners();
  }

  String? isSwitch1;
  operator4(value) {
    isSwitch1 = value;

    notifyListeners();
  }


  String? dropdownValue4;
  opratr5(value) {
    dropdownValue4 = value;

    notifyListeners();
  }

  String? isSwitch2;
  operator6(value) {
    isSwitch2 = value;

    notifyListeners();
  }
  operator7() async{
     SharedPreferences prefs1 = await SharedPreferences.getInstance();
     expensAmount = prefs1.getInt("SavExp") ?? 0;
      incomeAmount = prefs1.getInt("incSav") ?? 0;
      mainbalance = prefs1.getInt("SavBalance") ?? 0;
       notifyListeners();
  }
  operator8()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     transactions=prefs.getStringList("ListSave")!;
     notifyListeners();
  }
  bool eyeView=false;
  LoginisObscured(eyeView){
    this.eyeView= !eyeView;
     notifyListeners();
  }
  bool eyeView2=true;
  SignUpObscured(eyeView2){
    this.eyeView2=!eyeView2;
    notifyListeners();
  }
  bool isSelected=false;
void check(changedValue){
isSelected=changedValue;
notifyListeners();
}
bool isLoading=false;
signUpLoading(isLoadingsignUp){
isLoading=!isLoadingsignUp;
notifyListeners();
}
bool isLoading2=false;
googoleLoading(isGoogleLoading){
  isLoading2=!isGoogleLoading;
notifyListeners();
}

bool isLoading3=false;
welcomeSignUpLoading(welcomeSignUpLoading){
isLoading3=!welcomeSignUpLoading;
notifyListeners();
}

bool isLoading4=false;
verifcationLoading(verifyLoading){
isLoading4=!verifyLoading;
notifyListeners();
}

bool isLoading5=false;
mobileVerification(mobileVerfy){
isLoading5=!mobileVerfy;
notifyListeners();
}
}

//   void listTransaction(){

//     List<String> transactions =[
//          Transaction(category:'shopping',discription:'EVirtuMart',amount:'\$30'),
//          Transaction(category:'subscription',discription:'Disney+Annual',amount:'\$20'),
//          Transaction(category:'food',discription:'HotelSafa',amount:'\$80')
//     ];

//     // List<Widget> transactionWidgets=transactions.map(Transaction){
//     //   return ListTile(
//     //     title:Text(Transaction.category),
//     //     subtitle:Text(Transaction.discription),
//     //     trailing:Text(Transaction.amount)
//     //   );
//     // }
//   }
// }
// Transaction({required String category, required String discription, required String amount}) {

