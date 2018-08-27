import 'package:flutter/material.dart';
import 'screens/loginScreen/loginScreen.dart';
import 'blocs/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Provider(
      //Todo filho dentro do provider terá acesso ao Bloc
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          body: new LoginScreen(),
        ),
      ),
    );
  }
}
