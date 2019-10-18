import 'package:demo/src/bloc_providers/user_bloc_provider.dart';
import 'package:demo/src/screens/profile.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UserBlocProvider(
      child: MaterialApp(
        title: 'Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.lightBlue,
          highlightColor: Colors.blue[50],
          indicatorColor: Colors.blue[100],
          bottomAppBarColor: Colors.amber[700],
          disabledColor: Colors.grey[400],
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.blue),
            body1: TextStyle(color: Colors.blue),
            body2: TextStyle(color: Colors.blue),
            subhead: TextStyle(color: Colors.blue),
            subtitle: TextStyle(color: Colors.blue),
            headline: TextStyle(color: Colors.blue),
            display1: TextStyle(color: Colors.blue),
          ),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white),
            body1: TextStyle(color: Colors.white),
            body2: TextStyle(color: Colors.white),
            subhead:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            subtitle: TextStyle(color: Colors.white),
          ),
        ),
        home: Profile(),
      ),
    );
  }
}
