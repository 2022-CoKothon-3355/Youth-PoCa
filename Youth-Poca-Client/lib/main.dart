import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youth_poca/pages/main_page.dart';
import 'package:youth_poca/pages/write_page.dart';
import 'package:permission_handler/permission_handler.dart';

import 'commons/poca_num_list.dart';
import 'components/portfolio.dart';

Future<bool> getPermission() async {
  Map<Permission, PermissionStatus> permissions =
      await [Permission.storage].request();
  print('per1 : $permissions');
  if (await Permission.storage.isGranted) {
    return Future.value(true);
  } else {
    return Future.value(false);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getPermission();
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
      // initialRoute: '/main',
      initialRoute: '/main',
      routes: {
        '/main': (context) => MainPage(),
        '/write': (context) => WritePage(),
      },
    );
  }
}
