import 'package:flutter_medical_app/auth.dart';
import 'package:flutter_medical_app/pages/loginPage.dart';
import 'package:flutter_medical_app/pages/resetPasswordPage.dart';
import 'package:flutter_medical_app/pages/searchPage.dart';
import 'package:flutter_medical_app/pages/accountPage.dart';
import 'package:flutter_medical_app/pages/home_page.dart';
import 'package:flutter_medical_app/pages/notifPage.dart';
import 'package:flutter_medical_app/pages/schedulePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_medical_app/pages/signupPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDSjrUOiZaTQR4DlOVpDpyQI4-IcJTtfC0",
        appId: "1:728834309564:android:14cef260e440ea4dcbbfb9",
        messagingSenderId: "728834309564",
        projectId: "medicalapp-6e5a8"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Health',
      // home: const MainPage(),
      routes: {
        "/": (context) => const auth(),
        "homePage": (context) => const MainPage(),
        "signupPage": (context) => const signupPage(),
        "loginPage": (context) => const loginPage(),
        "resetPasswordPage": (context) => const restPasswordPage(),
        "GoBackLoginScreen": (context) => const loginPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final Screens = [
    homePage(),
    schedulePage(),
    shearchPage(),
    notifPage(),
    accountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: Screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentPage,
        onTap: ((index) {
          setState(
            () {
              currentPage = index;
            },
          );
        }),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: currentPage == 0
                  ? Icon(
                      Icons.home,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.home,
                      color: Colors.grey.shade700,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: currentPage == 1
                  ? Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.calendar_month,
                      color: Colors.grey.shade700,
                    ),
              label: "Schedule"),
          BottomNavigationBarItem(
              icon: currentPage == 2
                  ? Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.search,
                      color: Colors.grey.shade700,
                    ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: currentPage == 3
                  ? Icon(
                      Icons.notifications,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.notifications,
                      color: Colors.grey.shade700,
                    ),
              label: "Notifications"),
          BottomNavigationBarItem(
              icon: currentPage == 4
                  ? Icon(
                      Icons.person,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.person,
                      color: Colors.grey.shade700,
                    ),
              label: "Account"),
        ],
      ),
    );
  }
}
