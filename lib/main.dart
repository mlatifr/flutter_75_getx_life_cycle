import 'package:flutter/material.dart';
//step 1
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
        actions: [
          IconButton(
              icon: Icon(Icons.pages),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TextPage(),
                ));
              })
        ],
      ),
      body: Center(
        child: Text('HOME PAGE'),
      ),
    );
  }
}

class TextPage extends StatelessWidget {
  final textC = TextController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Text Page'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //   builder: (context) => HomePage(),
              // ));
            }),
      ),
      body: Container(
        child: TextField(
          controller: textC.myC,
        ),
      ),
    );
  }
}

class TextController extends GetxController {
  final myC = TextEditingController();
}
