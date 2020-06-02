import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BalancePage();
}

class _BalancePage extends State<BalancePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Main Screen",
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen()),
          );
        },

        child: Hero(
            tag: "imageHero",
            child: Icon(
              Icons.ac_unit,
              size: 150,
            ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Screen"
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
            /*placeholderBuilder: (context, size, widget) {
              return Container(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(),
              );
            },*/
            flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
              return Icon(Icons.audiotrack);
            },
            transitionOnUserGestures: true,
            tag: "imageHero",
            child: Center(
              child:
                Icon(
                  Icons.ac_unit,
                  size: 150,
              ),
            ),
        ),

      ),
    );
  }
}

