import 'dart:developer';
import 'package:early_ed/database/user_data_provider.dart';
import 'package:early_ed/screens/School_info.dart';
import 'package:early_ed/screens/Student_info.dart';
import 'package:early_ed/screens/attendance_screen.dart';
import 'package:early_ed/screens/grades_screen.dart';
import 'package:early_ed/screens/news_screen.dart';
import 'package:early_ed/screens/user_chats/user_chats.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = '',
      userEmail = '',
      userId = '',
      parentOrChild = '',
      password = '',
      subject = '',
      type = '',
      userImageUrl = '';
  int age = 0, level = 0;
  List<String> mathGrades = [],
      englishGrades = [],
      scienceGrades = [],
      arabicGrades = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // استرجاع البيانات المحفوظة عند تحميل الصفحة
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
      userEmail = prefs.getString('userEmail') ?? '';
      userId = prefs.getString('userId') ?? '';
      parentOrChild = prefs.getString('parentOrChild') ?? '';
      password = prefs.getString('password') ?? '';
      subject = prefs.getString('subject') ?? '';
      type = prefs.getString('type') ?? '';
      userImageUrl = prefs.getString('userImageUrl') ?? '';
      age = prefs.getInt('age') ?? 0;
      level = prefs.getInt('level') ?? 0;
      mathGrades = prefs.getStringList('mathGrades') ?? [];
      arabicGrades = prefs.getStringList('arabicGrades') ?? [];
      scienceGrades = prefs.getStringList('scienceGrades') ?? [];
      englishGrades = prefs.getStringList('englishGrades') ?? [];
    });
  }

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
          "EARLYED -- ${userName}",
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
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
                      builder: (context) => GradesScreen(math: mathGrades, arabic: arabicGrades, english: englishGrades, science: scienceGrades)
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
                      builder: (context) => const AttendanceScreen(),
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
                      builder: (context) => NewsScreen(canEdit: type == 'ad' || type == 'te'),
                    ));
                log(type);
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
