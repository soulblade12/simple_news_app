import 'package:flutter/material.dart';
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
        child:Scaffold(
          appBar: AppBar(
            title: Text("Berita",style: TextStyle(fontWeight: FontWeight.bold)),centerTitle: true,
          bottom:TabBar(tabs: [
            Tab(icon: Icon(Icons.newspaper),),
            Tab(icon: Icon(Icons.favorite),),

          ])
          ),
          body: TabBarView(children: [
            ViewNewspaper(),
            Text("data")
          ]),
        )
    );
    // return Scaffold(
    //   appBar:
    //   AppBar(title: Text('News')),
    //   body: DefaultTabController(length: 2, child: child),
    // );
  }
}
