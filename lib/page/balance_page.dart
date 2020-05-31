import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BalancePage();
}

class _BalancePage extends State<BalancePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Balance"),
      ),
    );
  }
}