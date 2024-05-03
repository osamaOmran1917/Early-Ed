import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:jiffy/jiffy.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  var today = Jiffy.now().MMMd;
  var dayName = Jiffy.now().E;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        iconSize: 40,
      ),
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)),
              width: size.width,
              height: 50,
              child: Row(
                children: [
                  Text('$dayName/'),
                  Text(today),
                  const Spacer(),
                  ElevatedButton(onPressed: () {}, child: const Text("Absent"))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)),
              width: size.width,
              height: 50,
              child: Row(
                children: [
                  Text('$dayName/'),
                  Text(today),
                  const Spacer(),
                  ElevatedButton(onPressed: () {}, child: const Text("Absent"))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)),
              width: size.width,
              height: 50,
              child: Row(
                children: [
                  Text('$dayName/'),
                  Text(today),
                  const Spacer(),
                  ElevatedButton(onPressed: () {}, child: const Text("Absent"))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black)),
              width: size.width,
              height: 50,
              child: Row(
                children: [
                  Text('$dayName/'),
                  Text(today),
                  const Spacer(),
                  ElevatedButton(onPressed: () {}, child: const Text("Absent"))
                ],
              ),
            ),
            // TableCalendar(
            //   lastDay: DateTime.utc(2030, 10, 5),
            //   firstDay: DateTime.utc(2010, 10, 5),
            //   focusedDay: today,
            // ),
          ],
        ),
      ),
    );
  }
}
