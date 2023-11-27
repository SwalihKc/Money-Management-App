import 'package:expense_app/transferPage.dart';
import 'package:expense_app/welcomePage.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ExpensPage.dart';
import 'Function.dart';
import 'Spend Freqency Graph.dart';
import 'incomPage.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    super.key,
  });

  String dropdownValue0 = 'October';
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // @override

  // eraceData() async {
  Widget build(BuildContext context) {
    final prov = Provider.of<function>(context);
    prov.operator7();
    FirebaseAuth auth=FirebaseAuth.instance;

    return Visibility(
      visible: true,
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  'Account',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(127, 61, 255, 1),
                ),
              ),
              ListTile(
                title: Text('Log Out'),
               
                trailing: InkWell(onTap: ()=> _signOut(context),
                  
                
                  child: Icon(Icons.logout),),
                
              ),
            ],
          ),
        ),
        drawerEnableOpenDragGesture: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Color(0xfffff6e5),
            elevation: 1,
            shadowColor: Colors.transparent,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: () => _key.currentState!.openDrawer(),
                child: Image.asset(
                  "assets/404-4042710_circle-profile-picture-png-transparent-png.png",
                ),
              ),
            ),
            centerTitle: true,
            title: SizedBox(
              width: 165,
              height: 85,
              child: Center(
                child: DropdownButtonFormField<String>(
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black),
                  icon: SizedBox.shrink(),
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/arrow-down-2.png',
                      scale: 0.7,
                    ),
                    contentPadding: EdgeInsets.all(13.5),
                    fillColor: Color(0xfffff6e5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 191, 210, 241)),
                    ),
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue0,
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   dropdownValue = newValue!;
                    // });
                    prov.oprator0(newValue);
                  },
                  items: <String>[
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'Jun',
                    'July',
                    'Agust',
                    'September',
                    'October',
                    'November',
                    'December'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            actions: [
              GestureDetector(
                child: Image.asset(
                  'assets/notifiaction.png',
                  scale: 0.78,
                ),
                onDoubleTap: () {
                  // eraceData();
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 205,
                width: 393,
                decoration: BoxDecoration(
                  color: Color(0xfffff6e5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Account Balance',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '\$${prov.mainbalance}',
                      style: GoogleFonts.inter(
                          fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 118,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(children: [
                            Container(
                              height: 80,
                              width: 164,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.green,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 35),
                                    child: Text(
                                      'Income',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 4, left: 45),
                                    child: Text(
                                      '\$${prov.incomeAmount}',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16, left: 18),
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white),
                                child: Image.asset(
                                  'assets/income.png',
                                  color: Colors.green,
                                ),
                              ),
                            )
                          ]),
                          Stack(children: [
                            Container(
                              height: 80,
                              width: 164,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 45),
                                    child: Text(
                                      'Expenses',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 4, left: 50),
                                    child: Text(
                                      '\$${prov.expensAmount}',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18, top: 16),
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  'assets/expense.png',
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GraphPage()
            ],
          ),
        ),
        floatingActionButton: FabCircularMenuPlus(
          fabCloseIcon: Icon(
            Icons.close,
            size: 30,
            color: Colors.white,
          ),
          fabOpenIcon: const ImageIcon(
            AssetImage('assets/close@2x.png'),
            size: 60,
            color: Colors.white,
          ),
          fabColor: Color.fromRGBO(127, 61, 255, 1),
          alignment: Alignment.bottomCenter,
          ringColor: Colors.white.withAlpha(25),
          ringDiameter: 450.0,
          ringWidth: 190.0,
          fabSize: 70.0,
          fabElevation: 8.0,
          fabIconBorder: const CircleBorder(),
          animationDuration: Duration(milliseconds: 900),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => incomePage(),
                    ));
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  color: Colors.green,
                ),
                child: ImageIcon(
                  AssetImage("assets/income.png"),
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => incomePage(),
                    ));
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => fourthPaeg(),
                      ));
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    color: Colors.blue,
                  ),
                  child: ImageIcon(
                    AssetImage("assets/currency-exchange.png"),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(),
                    ));
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  color: Colors.red,
                ),
                child: ImageIcon(
                  AssetImage("assets/expense.png"),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomAppBar(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ImageIcon(
                    AssetImage('assets/home.png'),
                    color: Color.fromRGBO(127, 61, 255, 1),
                    size: 40,
                  ),
                  Text('Home'),
                ],
              ),
              Column(
                children: [
                  ImageIcon(
                    AssetImage('assets/transaction.png'),
                    color: Colors.grey,
                    size: 40,
                  ),
                  Text('Transaction'),
                ],
              ),
              Divider(
                endIndent: 10,
                indent: 30,
              ),
              Column(
                children: [
                  ImageIcon(
                    AssetImage('assets/pie-chart.png'),
                    color: Colors.grey,
                    size: 40,
                  ),
                  Text('Budget'),
                ],
              ),
              Column(
                children: [
                  ImageIcon(
                    AssetImage('assets/user.png'),
                    color: Colors.grey,
                    size: 40,
                  ),
                  Text('profile'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => welcomePage(),));
  print('logout');
  
}
}
