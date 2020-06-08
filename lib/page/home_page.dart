import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  List _imageUri = [
    "https://www1.payforex.net/wp-content/themes/payforex201909/images/page/remittance/singapore.jpg",
    "https://www1.payforex.net/wp-content/themes/payforex201909/images/page/remittance/china.jpg",
    "https://www1.payforex.net/wp-content/themes/payforex201909/images/page/remittance/australia.jpg",
    "https://www1.payforex.net/wp-content/themes/payforex201909/images/page/remittance/euro-area-en.jpg",
    "https://www1.payforex.net/wp-content/themes/payforex201909/images/page/remittance/india.jpg"
  ];

  final todoList = List<ToDo>.generate(20, (index) =>
    ToDo("Title $index", "description $index"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              child: Swiper(
                itemCount: _imageUri.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    _imageUri[index],
                    fit:BoxFit.fitWidth,
                  );

                },
                pagination: new SwiperPagination(),
                control: new SwiperControl(
                  color: Colors.white,
                ),

              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todoList[index].title),
                    subtitle: Text(todoList[index].description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ToDoScreen(todoList[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToDo {
  String title;
  String description;

  ToDo(this.title, this.description);
}

class ToDoScreen extends StatelessWidget {

  final ToDo todo;

  ToDoScreen(this.todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo Screen"),
      ),
      body: Container(
        child: ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
        ),
      ),
    );
  }
}
