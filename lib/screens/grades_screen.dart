import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:early_ed/database/my_database.dart';
import 'package:early_ed/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Grades extends StatefulWidget {
  Grades({super.key, required this.math, required this.arabic, required this.english, required this.science});
  final List<String> math, arabic, english, science;

  @override
  State<Grades> createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  TextEditingController mathController = TextEditingController();
  TextEditingController arabicController = TextEditingController();
  TextEditingController scienceController = TextEditingController();
  TextEditingController englishController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  String? mathGrade, arabicGrade, englishGrade, scienceGrade, type;

  @override
  void initState() {
    super.initState();
    _getGradesFromFirebase();
  }

  Future<void> _getGradesFromFirebase() async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection('userslist')
        .doc(auth.currentUser!.uid)
        .get();
    var data = documentSnapshot.data();
    setState(() {
      mathGrade = data!['mathGrades'][0];
      arabicGrade = data['arabicGrades'][0];
      scienceGrade = data['scienceGrades'][0];
      englishGrade = data['englishGrades'][0];
      type = data['type'];
    });
  }

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
          GestureDetector(
            onTap: () {
              if(type == 'ad' || type == 'te') {
                showDialog(
                context: context,
                builder: (_) => Form(
                  key: formKey,
                  child: AlertDialog(
                    contentPadding:
                    EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h, bottom: 10.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Row(children: [
                      const Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 28,
                      ),
                      SizedBox(width: 7.w),
                      const Text('Edit Grade')
                    ]),
                    content: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: mathController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Math Grade'
                      ),
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                           MyDataBase.updateGrades(auth.currentUser!.uid, 'mathGrades', [mathController.text.trim().toString()]);
                           mathGrade = mathController.text.trim().toString();
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           prefs.setStringList('mathGrades', [mathController.text.trim().toString()]);
                            Navigator.pop(context);
                            setState(() {});
                          }
                        },
                        child: const Text(
                          'save',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              width: 280.w,
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: Colors.blueAccent)
              ),
              child: Text(
                  "Math   ${mathGrade ?? widget.math[0]}/50",
                style: TextStyle(
                  fontSize: 35.h,
                  color: Colors.black
                )
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              if(type == 'ad' || type == 'te') {
                showDialog(
                context: context,
                builder: (_) => Form(
                  key: formKey,
                  child: AlertDialog(
                    contentPadding:
                    EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h, bottom: 10.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Row(children: [
                      const Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 28,
                      ),
                      SizedBox(width: 7.w),
                      const Text('Edit Grade')
                    ]),
                    content: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: arabicController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Arabic Grade'
                      ),
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                           MyDataBase.updateGrades(auth.currentUser!.uid, 'arabicGrades', [arabicController.text.trim().toString()]);
                           arabicGrade = arabicController.text.trim().toString();
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           prefs.setStringList('arabicGrades', [arabicController.text.trim().toString()]);
                            Navigator.pop(context);
                            setState(() {});
                          }
                        },
                        child: const Text(
                          'save',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              width: 280.w,
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: Colors.blueAccent)
              ),
              child: Text(
                  "Arabic   ${arabicGrade ?? widget.arabic[0]}/50",
                style: TextStyle(
                  fontSize: 35.h,
                  color: Colors.black
                )
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              if(type == 'ad' || type == 'te') {
                showDialog(
                context: context,
                builder: (_) => Form(
                  key: formKey,
                  child: AlertDialog(
                    contentPadding:
                    EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h, bottom: 10.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Row(children: [
                      const Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 28,
                      ),
                      SizedBox(width: 7.w),
                      const Text('Edit Grade')
                    ]),
                    content: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: scienceController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Science Grade'
                      ),
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                           MyDataBase.updateGrades(auth.currentUser!.uid, 'scienceGrades', [scienceController.text.trim().toString()]);
                           scienceGrade = scienceController.text.trim().toString();
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           prefs.setStringList('scienceGrades', [scienceController.text.trim().toString()]);
                            Navigator.pop(context);
                            setState(() {});
                          }
                        },
                        child: const Text(
                          'save',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              width: 280.w,
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: Colors.blueAccent)
              ),
              child: Text(
                  "Science   ${scienceGrade ?? widget.science[0]}/50",
                style: TextStyle(
                  fontSize: 35.h,
                  color: Colors.black
                )
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              if(type == 'ad' || type == 'te') {
                showDialog(
                context: context,
                builder: (_) => Form(
                  key: formKey,
                  child: AlertDialog(
                    contentPadding:
                    EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h, bottom: 10.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Row(children: [
                      const Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 28,
                      ),
                      SizedBox(width: 7.w),
                      const Text('Edit Grade')
                    ]),
                    content: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: englishController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'English Grade'
                      ),
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                           MyDataBase.updateGrades(auth.currentUser!.uid, 'englishGrades', [englishController.text.trim().toString()]);
                           englishGrade = englishController.text.trim().toString();
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           prefs.setStringList('englishGrades', [englishController.text.trim().toString()]);
                            Navigator.pop(context);
                            setState(() {});
                          }
                        },
                        child: const Text(
                          'save',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              width: 280.w,
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: Colors.blueAccent)
              ),
              child: Text(
                  "English   ${englishGrade ?? widget.english[0]}/50",
                style: TextStyle(
                  fontSize: 35.h,
                  color: Colors.black
                )
              )
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