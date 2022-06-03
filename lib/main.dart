import 'package:flutter/material.dart';
//step 1
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
  //step 2
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
  //step 4
  final countC = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    //step 5
    return GetBuilder<CounterController>(
        initState: (_) => print('this : initState'),
        didChangeDependencies: (_) => print('this : didChangeDependencies'),
        didUpdateWidget: (oldWidget, _) =>
            print('this : didUpdateWidget oldWidget $oldWidget '),
        dispose: (_) => print('this : dispose'),
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
  //step 3
  var count = 0;
  void add() {
    count++;
    update();
  }
}
