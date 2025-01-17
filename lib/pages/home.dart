import 'package:dev_hiring_challenge/pages/repository.dart';
import 'package:flutter/material.dart';


import 'config.dart';
import 'feed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 1;
  String message = "Home";

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [RepositoriesPage(), FeedPage(), Config()];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text( message ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("conta");
            },
          ),
        ],
      ),
      body: GetBody(pages),
      bottomNavigationBar: getBottom(),
    );
  }

  GetBody(List pages) {
    return Container(
      padding: EdgeInsets.all(16),
      child: pages[_indiceAtual],
    );
  }

  getBottom() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
            if(_indiceAtual == 0) {
              setState(() {
                message = "Favoritos";
              });
            }else {
              setState(() {
                message = "Home";
              });
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.red[900],
              title: Text("Favorites"),
              icon: Icon(Icons.star, color: Colors.white)),
          BottomNavigationBarItem(
              backgroundColor: Colors.red[900],
              title: Text("Home"),
              icon: Icon(Icons.home, color: Colors.white)),
          BottomNavigationBarItem(
            backgroundColor: Colors.red[900],
            title: Text("Search"),
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ]);
  }
}
