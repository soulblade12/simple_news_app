import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // Import kIsWeb
import 'package:hive/hive.dart';
import 'package:news_app/screen/webview.dart';

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
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                if (kIsWeb) {
                  // If running on the web, show an alert
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Unsupported Operation"),
                        content: Text("WebView is not supported on Windows apps."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // If not running on the web, navigate to the WebView screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(url: favoriteNews["url"]),
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
