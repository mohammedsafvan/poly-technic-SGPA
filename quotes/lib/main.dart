import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text =
      'IF there is a will there is a way and you are nothing without the help of allah, the mighty and magnificent';
  final FlipCardController _controller = FlipCardController();
  void doStuff() {
    _controller.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlipCard(
          controller: _controller,
          front: Container(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white70),
            ),
            color: Colors.amber,
            width: 100,
            height: 100,
          ),
          back: Container(
            child: Text('kooi'),
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
          fill: Fill.fillFront,
        ),

        // child: Container(
        //   padding: EdgeInsets.all(10),
        //   height: 300,
        //   width: 300,
        //   decoration: BoxDecoration(boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey,
        //       offset: const Offset(
        //         5.0,
        //         5.0,
        //       ),
        //       blurRadius: 15.0,
        //       spreadRadius: 1.0,
        //     ),
        //     BoxShadow(color: Colors.black),
        //   ], borderRadius: BorderRadius.circular(39), color: Colors.blueAccent),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         text,
        //         textAlign: TextAlign.center,
        //         style: TextStyle(fontSize: 30, color: Colors.white70),
        //       ),
        //       SizedBox(height: 50),
        //       Text('hi')
        //     ],
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.toggleCard();
          print('object');
        },
      ),
    );
  }
}
