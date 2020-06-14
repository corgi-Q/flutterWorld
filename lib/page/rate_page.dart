import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RateState();
}

class _RateState extends State<RatePage> {

  Future<Album> futureAlbum;

  Future<Album> futureCreateAlbum;

  /// page no
  int _pageNo = 1;

  /// album title input controller
  final TextEditingController _albumTitleController = TextEditingController();

  /// http request handled in initState
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(_pageNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Album"),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder<Album>(
            future: fetchAlbum(_pageNo),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Page No $_pageNo"),
                      Text(snapShot.data.title),
                    ],
                  ),
                );
              } else if (snapShot.hasError) {
                return Text("${snapShot.error}");
              }

              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator(),);
            },
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: (futureCreateAlbum == null)
              ? Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   TextField(
                     controller: _albumTitleController,
                     decoration: InputDecoration(hintText: "input album title"),
                   ),
                   RaisedButton(
                       child: Text("create data"),
                       onPressed: () {
                         setState(() {
                           futureCreateAlbum = createAlbum(_albumTitleController.text);
                         });
                       }
                   ),
                 ],
              )
              : FutureBuilder<Album>(
                 future: futureCreateAlbum,
                 builder: (context, snapshot) {
                   if(snapshot.hasData) {
                     return Text(snapshot.data.title);
                   } else if(snapshot.hasError) {
                     return Text("${snapshot.hasError}");
                   }

                   return CircularProgressIndicator();
                 },
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("Next"),
          onPressed: () {
            setState(() {
              _pageNo++;
            });
          }
      ),
    );
  }

  /// Fetch album data, page no 1
  Future<Album> fetchAlbum(int pageNo) async {

    final response = await http.get("https://jsonplaceholder.typicode.com/albums/${pageNo}");

    if(response != null && response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception("Fail to load album");
    }
  }

  Future<Album> createAlbum(String title) async {
    final http.Response response = await http.post(
      'https://jsonplaceholder.typicode.com/albums',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if(response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load album");
    }
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json["userId"],
      id: json["id"],
      title: json["title"]
    );
  }
}