import 'dart:developer';
import 'package:early_ed/database/my_database.dart';
import 'package:early_ed/database/user_data_provider.dart';
import 'package:early_ed/helpers/common_methods.dart';
import 'package:early_ed/helpers/dialog_utils.dart';
import 'package:early_ed/helpers/shared_data.dart';
import 'package:early_ed/screens/Home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKye = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool securedPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Form(
          key: formKye,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 220.h),
                Image.asset(
                  "assets/images/LOGO1.png",
                  width: 150,
                  height: 140,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter e-mail address';
                    }
                    if (!ValidationUtils.isValidEmail(text)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black)),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscureText: securedPassword,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.black),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                          securedPassword = !securedPassword;
                        }),
                        child: Icon(securedPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 15),
                MaterialButton(
                  color: Colors.white12,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                  // fixedSize:Size(350,25)),
                  onPressed: signIn,
                  child: const Text("LOG IN",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    if (formKye.currentState?.validate() == false) {
      return;
    }
    try {
      showLoading(context, 'Loading..');
      var credential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var retrievedUser =
      await MyDataBase.getUserById(credential.user?.uid ?? '');
      var userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
      userDataProvider.setData('arabicGrades', retrievedUser?.arabicGrades?.map((item) => item.toString()).toList());
      userDataProvider.setData('email', retrievedUser?.email);
      userDataProvider.setData('englishGrades', retrievedUser?.englishGrades?.map((item) => item.toString()).toList());
      userDataProvider.setData('feedbacks', retrievedUser?.feedbacks?.map((item) => item.toString()).toList());
      userDataProvider.setData('userName', retrievedUser?.userName);
      userDataProvider.setData('id', retrievedUser?.id);
      userDataProvider.setData('mathGrades', retrievedUser?.mathGrades?.map((item) => item.toString()).toList());
      userDataProvider.setData('parentOrChildName', retrievedUser?.parentOrChildName);
      userDataProvider.setData('password', retrievedUser?.password);
      userDataProvider.setData('scienceGrades', retrievedUser?.scienceGrades?.map((item) => item.toString()).toList());
      userDataProvider.setData('type', retrievedUser?.type);
      hideLoading(context);
      if (retrievedUser == null) {
        showMessage(context, 'Wrong username or wrong password');
      } else {
        SharedData.user = retrievedUser;
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      hideLoading(context);
      showMessage(context, 'Something went wrong, please try again');
      log(e.code);
    }
  }
}