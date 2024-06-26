import 'package:early_ed/database/user_data_provider.dart';
import 'package:early_ed/firebase_options.dart';
import 'package:early_ed/screens/auth/auth_screen.dart';
import 'package:early_ed/screens/home_screen.dart';
import 'package:early_ed/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return UserDataProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late UserDataProvider userDataProvider;
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    userDataProvider = Provider.of<UserDataProvider>(context);
    getValueFromShared();
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            home: /*StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, snapShot) {
                if (snapShot.hasData) {
                  return */
                const SplashScreen() /*;
                } else {
                  return const AuthScreen();
                }
              },
            )*/
            ,
            routes: {
              HomeScreen.routeName: (_) => const HomeScreen(),
              AuthScreen.routeName: (_) => const AuthScreen()
            }));
  }

  void getValueFromShared() async {
    final prefs = await SharedPreferences.getInstance();
    userDataProvider.setData('userName', prefs.getString('userName') ?? '');
  }
}