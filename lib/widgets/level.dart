import 'package:early_ed/screens/StudentsListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Level extends StatelessWidget {
  const Level({super.key, required this.level});
  final int level;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => StudentsListScreen(level: level)));
      },
      child: SizedBox(
        height: 70.h,
        child: Card(
          child: Center(
            child: Text(level.toString()),
          ),
        ),
      ),
    );
  }
}
