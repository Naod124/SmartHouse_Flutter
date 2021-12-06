import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_house/models/AppModel.dart';

import 'Screen/login_screen.dart';

void main() {
  AppModel appModel = new AppModel();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => appModel),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData getTheme(context) {
    var appModel = Provider.of<AppModel>(context);
    var isDarkTheme = appModel.darkTheme;

    if (isDarkTheme) {
      return ThemeData.dark();
    }
    return ThemeData.light();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart house',
      theme: getTheme(context),
      home: LoginScreen(),
    );
  }
}
