import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_generator/screen/client_data_screen.dart';
import 'package:invoice_generator/screen/home_screen.dart';
import 'package:invoice_generator/screen/invoice_screen.dart';
import 'package:invoice_generator/screen/itemscreen.dart';
import 'package:invoice_generator/screen/splash_screen.dart';
void main()
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.indigo));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: 'item',
      routes: {
        '/':(context) => splashscreen(),
        'home':(context) => Homescreen(),
        'client':(context) => ClientScreen(),
        'item':(context) => Itemscreen(),
        'invoice':(context) => Invoicescreen(),
      },
    ),
  );
}