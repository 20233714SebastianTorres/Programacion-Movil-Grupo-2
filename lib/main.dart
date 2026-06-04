import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:biblioul/pages/home/home_page.dart';
import 'package:biblioul/pages/profile/profile_page.dart';
import 'package:biblioul/pages/coments/coments.dart';
import 'package:biblioul/pages/list/list_fav.dart';
import 'package:biblioul/pages/recover_password/recover_password_page.dart';
import 'package:biblioul/pages/sign_up/sign_up_page.dart';
import 'package:biblioul/pages/sign_in/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieApp',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF020617),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF111827),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF111827),
          selectedItemColor: Color(0xFF8B5CF6),
          unselectedItemColor: Colors.white54,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF7C3AED),
          secondary: Color(0xFF8B5CF6),
          surface: Color(0xFF111827),
        ),
      ),
      initialRoute: '/sign-in',
      routes: {
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/recover-password': (context) => RecoverPasswordPage(),
        '/movies': (context) => const HomePage(),
        '/profile': (context) => ProfilePage(),
        '/list': (context) => ListFavPage(),
        '/coments': (context) => ComentsPage(),
      },
    );
  }
}
