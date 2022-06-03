import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final countC = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.pages),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => OtherPage(),
                ));
              })
        ],
      ),
      body: Center(
        child: CountWidget(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        countC.add();
      }),
    );
  }
}

class CountWidget extends StatelessWidget {
  final countC = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
        builder: (c) => Text('Angka ${c.count}'));
  }
}

class OtherPage extends StatelessWidget {
  const OtherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            }),
      ),
      body: Container(),
    );
  }
}

class CounterController extends GetxController {
  var count = 0;
  void add() {
    count++;
    update();
  }
}
