import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youth_poca/pages/main_page.dart';
import 'package:youth_poca/pages/write_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
        // scaffoldBackgroundColor: Color(0xFFe9e9e9),
        primaryColor: Colors.white,
        accentColor: Color(0xFF06A66C),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      routes: {
        '/main': (context) => MainPage(),
        '/write': (context) => WritePage(),
      },
    );
  }
}
