import 'package:flutter/material.dart';
import '../providers/users.dart';
import '../screens/users_screen.dart';
import 'package:provider/provider.dart';

class GTechApp extends StatelessWidget {
  Widget? tab1;
  Widget? tab2;
  Widget? tab3;
  Widget? tab4;
  String? title1;
  String? title2;
  String? title3;
  String? title4;

  GTechApp({
    this.tab1,
    this.tab2,
    this.tab3,
    this.tab4,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((ctx) => Users())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: UsersScreen(
          screen1: tab1,
          screen2: tab2,
          screen3: tab3,
          screen4: tab4,
          title1: title1,
          title2: title2,
          title3: title3,
          title4: title4,
        ),
      ),
    );
  }
}
