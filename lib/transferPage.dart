import 'package:dotted_border/dotted_border.dart';
import 'package:expense_app/Function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class fourthPaeg extends StatelessWidget {
  const fourthPaeg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(220),
        child: AppBar(
          backgroundColor: Colors.blue,
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
            'Transfer',
            style: TextStyle(fontSize: 23),
          ),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 35,
            child: Padding(
              padding: EdgeInsets.all(8.0),
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
              ),
            ),
          Column(
            children: [
              Container(
                height: 395,
                width: 490,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(35)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Stack(children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                              height: 80,
                              width: 170,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'From',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            width: 170,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'To',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 170,
                        top: 23,
                        child: Container(
                          height: 41,
                          width: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Image.asset('assets/transaction.png'),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Discripition',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                      DottedBorder(
                      child: Container(
                        height: 55,
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage('assets/attachment.png'),
                              size: 45,
                            ),
                         TextButton(onPressed: () {
                           
                         }, child:Text('Add attachment',style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 119, 117, 117)),), )
                          ],
                        ),
                      ),
                      dashPattern: [7, 9],
                      strokeWidth: 0.6,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(14),
                    ),
                    SizedBox(height: 30,),
                     Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(117, 54, 241, 1)),
                          child: TextButton(onPressed: () {
                            
                          }, child: Text('Continue',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25),)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
