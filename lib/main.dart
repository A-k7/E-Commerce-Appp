import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Lato",
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 35) ,
          titleMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black
            )
          ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1) ,
          primary: const Color.fromRGBO(254, 206, 1, 1)),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 16),
        prefixIconColor: Color.fromRGBO(119, 119, 119, 1))
        ),
        debugShowCheckedModeBanner: false,
        title: 'Shopping app',
        home: HomePage(),
      ),
    );}
}