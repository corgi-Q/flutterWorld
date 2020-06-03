import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BalancePage();
}

class _BalancePage extends State<BalancePage> {

  static const routeName = "/detailScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreen(),
    );
  }
}

class ScreenArguments {

  String title;
  String msg;

  ScreenArguments(this.title, this.msg);

}

class MainScreen extends StatelessWidget {

  static const routeName = "/mainScreen";

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
          Navigator.pushNamed(
              context,
              DetailScreen.routeName,
              arguments: ScreenArguments("Greetings", "I'am from Main Screen"),
          );
        },

        child: Hero(
            tag: "imageHero",
            child: Icon(
              Icons.ac_unit,
              size: 50,
              color: Colors.blue,
            ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {

  static const routeName = "/detailScreen";

  String msg;

  @override
  Widget build(BuildContext context) {

    ScreenArguments screenArguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            screenArguments.title
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(
              context,
              "I'am from Detail Screen"
          );
        },
        child: Hero(
          flightShuttleBuilder: (context, animation, direction, fromContext,
              toContext) {
            return Icon(Icons.audiotrack);
          },
          transitionOnUserGestures: true,
          tag: "imageHero",
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.ac_unit,
                  size: 50,
                  color: Colors.blueAccent,
                ),
                Text(
                    screenArguments.msg,
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

