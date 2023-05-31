import 'package:data_mites/loginPage.dart';
import 'package:data_mites/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => User())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "DataMites",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
