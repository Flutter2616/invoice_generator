import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png",height: 300,width: 300,fit: BoxFit.fill),
            CircularProgressIndicator(backgroundColor: Colors.white,color: Colors.amber,)
          ],
        ),
      ),
    );
  }
}
