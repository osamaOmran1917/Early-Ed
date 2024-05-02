import 'package:early_ed/database/user_data_provider.dart';
import 'package:early_ed/screens/Calendar.dart';
import 'package:early_ed/screens/School_info.dart';
import 'package:early_ed/screens/Student_info.dart';
import 'package:early_ed/screens/grades_screen.dart';
import 'package:early_ed/screens/news_screen.dart';
import 'package:early_ed/screens/user_chats/user_chats.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'Home Screen';

  @override
  Widget build(BuildContext context) {
    //final size =MediaQuery.of(context).size;
    var userDataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home, size: 35),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        title: Text(
          "EARLYED -- ${userDataProvider.userName}",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SchoolInfo(),
                  ));
            },
            icon: const Icon(Icons.more_vert_rounded),
            iconSize: 30,
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Grades(),
                    ));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: const Text(
                  "GRADES",
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Calendar(),
                    ));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: const Text(
                  "ATTENDANCE",
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewsScreen(),
                    ));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: const Text(
                  "NEWS",
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentInfo(),
                    ));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: const Text(
                  "STUDENT INFO",
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyChat(),
                    ));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: const Text(
                  "Chat",
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                width: 310,
                height: 210,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 6),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: Image.asset(
                  "assets/images/student.jpg",
                  fit: BoxFit.fitHeight,
                )),
          ],
        ),
      ),
    );
  }
}