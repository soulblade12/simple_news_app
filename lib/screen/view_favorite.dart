import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ViewFavorite extends StatefulWidget {
  const ViewFavorite({Key? key}) : super(key: key);

  @override
  State<ViewFavorite> createState() => _ViewFavoriteState();
}

class _ViewFavoriteState extends State<ViewFavorite> {
  @override
  Widget build(BuildContext context) {
    var favoriteNewsBox = Hive.box<Map>('favorite_news');

    return ListView.builder(
      itemCount: favoriteNewsBox.length,
      itemBuilder: (ctx, index) {
        var favoriteNews = favoriteNewsBox.getAt(index);

        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(favoriteNews!['title']),
            // Add any other details you want to display in the card

            // Example of IconButton to go to the next page
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                // Navigate to the next page

              },
            ),
          ),
        );
      },
    );
  }
}


