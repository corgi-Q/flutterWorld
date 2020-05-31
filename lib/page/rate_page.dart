import 'package:flutter/material.dart';

class RatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RateState();
}

class _RateState extends State<RatePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Rate"),
      ),
    );
  }
}