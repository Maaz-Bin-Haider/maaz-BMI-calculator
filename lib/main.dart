
import 'package:bmicalculator/pages/firstPage.dart';

import 'package:bmicalculator/provider/customSliderProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomSliderProvider(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        
        title: 'Flutter Demo',
        home: FirstPage(),
      ),
    );
  }
}




