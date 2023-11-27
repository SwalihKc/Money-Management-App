import 'dart:convert';
import 'package:expense_app/Function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({
    super.key,
  });

  String? dropdownValue3;

  String? dropdownValue4;

  bool isSwitch2 = false;

  var newTransactionData = {};

  DateTime now = DateTime.now();

  var expensAmountController1 = TextEditingController();

  var SubtitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<function>(context);
    void functionExp(context) async {
      String ExpAmount = expensAmountController1.text;
      String Subtitle = SubtitleController.text;
      int expensevalue = int.parse(ExpAmount);
      newTransactionData["category"] = prov.dropdownValue3;
      newTransactionData["amount"] = expensevalue;
      newTransactionData["transactionType"] = "expense";
      newTransactionData["subtitle"] = Subtitle;
      newTransactionData["datetime"] = DateFormat.jm().format(now);
      var newList = jsonEncode(newTransactionData);
      prov.transactions.add(newList);
      print(prov.transactions);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList("ListSave", prov.transactions);

      prov.expAdd(expensevalue);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          backgroundColor: Colors.red,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: ImageIcon(
              AssetImage('assets/arrow-left.png'),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Expense',
            style: TextStyle(fontSize: 23),
          ),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'How much?',
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 65,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 65,
                      fontWeight: FontWeight.w600),
                  hintText: '0',
                  prefixIcon: Text(
                    '\$',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 65,
                        fontWeight: FontWeight.w600),
                  )),
              keyboardType: TextInputType.number,
              controller: expensAmountController1,
            ),
          ),
          Container(
            height: 483,
            width: 490,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(35)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        hint: Text(
                          'Catogary',
                          style: TextStyle(fontSize: 22),
                        ),
                        items: [
                          'Shopping',
                          'Food',
                          'Subscription',
                          'Transpotation',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          // setState(() {
                          //   dropdownValue3 = value;
                          // });
                          prov.operator3(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        style: TextStyle(fontSize: 22),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Description',
                        ),
                        controller: SubtitleController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.amber),
                        hint: Text(
                          'Wallet',
                          style: TextStyle(fontSize: 21),
                        ),
                        items: ['Paytm', 'Phone pe', 'G-pay', 'Cash']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          // setState(() {
                          //   dropdownValue4 = value;
                          // });
                          prov.operator4(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DottedBorder(
                      child: Container(
                        height: 55,
                        width: 370,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage('assets/attachment.png'),
                              size: 45,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Add attachment',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(80, 78, 78, 1)),
                                ))
                          ],
                        ),
                      ),
                      dashPattern: [7, 9],
                      strokeWidth: 0.6,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(14),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListTile(
                        title: Text(
                          'Repeate',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text('Repeat Transaction'),
                        trailing: Switch(
                          value: isSwitch2,
                          onChanged: (value) {
                            // setState(() {
                            //   isSwitch = value;
                            // });
                            prov.oprator1(value);
                          },
                          activeColor: Colors.white,
                          activeTrackColor: Color.fromRGBO(117, 54, 241, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(117, 54, 241, 1)),
                      child: TextButton(
                          onPressed: () {
                            functionExp(context);
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
