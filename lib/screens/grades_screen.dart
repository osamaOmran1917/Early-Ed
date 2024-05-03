import 'package:early_ed/database/my_database.dart';
import 'package:early_ed/database/user_data_provider.dart';
import 'package:early_ed/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Grades extends StatelessWidget {
  const Grades({super.key, required this.math, required this.arabic, required this.english, required this.science});
  final List<String> math, arabic, english, science;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,

        // leading: IconButton(
        //   icon: const Icon(Icons.home,size: 35,),
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        //   },
        // ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        title: Column(
          children: [
            Image.asset(
              "assets/images/EARLYED.png",
              width: 150.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: const [
          Icon(Icons.more_vert_rounded, size: 33, color: Colors.black)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            alignment: Alignment.center,
            child: Text(
              "GRADES",
              style: TextStyle(
                fontSize: 40.h,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 280.w,
            height: 80.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: Colors.blueAccent)
            ),
            child: Text(
                "Math   ${math[0]}/50",
              style: TextStyle(
                fontSize: 35.h,
                color: Colors.black
              )
            )
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 280.w,
            height: 80.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Text(
              "Science   ${science[0]}/50",
              style: TextStyle(
                fontSize: 35.h,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 280.w,
            height: 80.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Text(
              "English ${english[0]}/50",
              style: TextStyle(
                fontSize: 35.h,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 280.w,
            height: 80.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Text(
              "Arabic   ${arabic[0]}/50",
              style: TextStyle(
                fontSize: 35.h,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                style: ButtonStyle(iconSize: MaterialStateProperty.all(60)),
                onPressed: () {},
                icon: const Icon(Icons.message_sharp),
                alignment: Alignment.bottomLeft,
              ),
              const Spacer(),
              IconButton(
                style: ButtonStyle(iconSize: MaterialStateProperty.all(60)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                icon: const Icon(Icons.arrow_circle_right_sharp),
                alignment: Alignment.bottomRight,
                iconSize: 60,
              ),
            ],
          )
        ]
      )
    );
  }
}