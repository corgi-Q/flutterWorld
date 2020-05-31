import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "images/lake.jpeg",
              //fit: BoxFit.fitWidth,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ],
    );
  }

  /// title section
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        FavoriteWidget(),
      ],
    ),
  );

  /// button section
  Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.blue, Icons.call, "CALL"),
        _buildButtonColumn(Colors.blue, Icons.navigation, "ROUTE"),
        _buildButtonColumn(Colors.blue, Icons.share, "SHARE"),
      ],
    ),
  );

  /// text section
  Widget textSection = Container(
    padding: EdgeInsets.all(32),
    child:Text(
        "Oeschinen Lake (German: Oeschinensee) is a lake in the Bernese Oberland, Switzerland, 4 kilometres (2.5 mi) east of Kandersteg in the Oeschinen valley. At an elevation of 1,578 metres (5,177 ft), it has a surface area of 1.1147 square kilometres (0.4304 sq mi). Its maximum depth is 56 metres (184 ft)."
        "The lake is fed through a series of mountain creeks and drains underground. The water then resurfaces as the Oeschibach. Part of it is captured for electricity production and as water supply for Kandersteg."
        "In observations from 1931 to 1965, the elevation of the lake surface varied between 1,566.09 metres (5,138.1 ft) and 1,581.9 metres (5,190 ft). The average seasonal variation was 12.2 metres (40 ft) (September/April)."
        "The lake is generally frozen during five months, from December to May. From time to time ice skating is possible on the ice."
        "Fish in the lake include Arctic char (Seesaibling), lake trout (Kanadische Seeforelle), rainbow trout (Regenbogenforelle). From January to March, ice fishing is popular.",
      softWrap: true,
     ),
  );
}

// favorite widget
class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteWidgetState();

}

class FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _favoritedCount = 41;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
          ),
        ),
        /// Placing the Text in a SizedBox and setting its width prevents
        /// a discernible “jump” when the text changes between the values of
        /// 40 and 41 — a jump would otherwise occur because those values
        /// have different widths.
        SizedBox(
          width: 18,
          child: Container(
            child: Text("$_favoritedCount"),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      _favoritedCount = _isFavorited ? ++_favoritedCount : --_favoritedCount;
    });
  }
}



Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Center(),
      Icon(icon,color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color
          ),
        ),
      ),
    ],
  );
}