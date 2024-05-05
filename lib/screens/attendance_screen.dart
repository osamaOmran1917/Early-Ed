import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:early_ed/database/my_database.dart';
import 'package:early_ed/widgets/attendance_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key, this.studentId});
  final studentId;

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          title: Column(
            children: [
              Image.asset(
                "assets/images/EARLYED.png",
                width: 150,
                height: 100,
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
        body: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "Attendance",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: firestore
                            .collection('userslist')
                            .doc(widget.studentId ?? auth.currentUser!.uid)
                            .snapshots(),
                        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                          if (!snapshot.hasData || !snapshot.data!.exists) {
                            return const Center(child: Text('No data found'));
                          }

                          var data = snapshot.data!;
                          return ListView.builder(
                            itemBuilder: (buildContext, index) {
                              return AttendanceData(
                                day: Jiffy.now().subtract(days: data['May'].length - 1 - index).E,
                                date: Jiffy.now().subtract(days: data['May'].length - 1 - index).MMMd,
                                present: data['May'][index] == '1',
                                attendance: data['May'].map((item) => item.toString()).toList(),
                                index: index,
                              );
                            },
                            itemCount: data['May'].length,
                          );
                        },
                      )
                  )])));
  }
}
