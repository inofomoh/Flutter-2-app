
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _output = "Model not loaded";

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  loadModel() async {
    String? res = await Tflite.loadModel(
      model: "assets/mobilenet_v1_1.0_224.tflite",
      labels: "assets/labels.txt",
    );
    setState(() {
      _output = res ?? "Model failed to load";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TFLite Flutter App")),
        body: Center(child: Text(_output)),
      ),
    );
  }
}
