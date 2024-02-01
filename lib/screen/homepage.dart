import 'package:flutter/material.dart';
import 'package:news_app/screen/view_favorite.dart';
import 'package:news_app/screen/view_newspaper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Berita",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white10, // Change the background color
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.newspaper),
                text: "News",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favorites",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ViewNewspaper(),
            ViewFavorite(),
          ],
        ),
      ),
    );
  }
}
