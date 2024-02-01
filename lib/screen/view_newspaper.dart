import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/data/datasource.dart';
import 'package:news_app/data/repository.dart';
import 'package:news_app/domain/entity.dart';

class ViewNewspaper extends StatefulWidget {
  const ViewNewspaper({Key? key}) : super(key: key);

  @override
  State<ViewNewspaper> createState() => _ViewNewspaperState();
}

class _ViewNewspaperState extends State<ViewNewspaper> {
  late Future<List<News>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    Hive.openBox<Map>('favorite_news');
    return FutureBuilder(
      future: futureNews,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var article = snapshot.data![index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Stack(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          "${article.urlToImage}",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        article.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        article.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: Icon(
                          article.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          final box =
                          await Hive.openBox<Map>('favorite_news');
                          setState(() {
                            article.isFavorite = !article.isFavorite;
                            if (article.isFavorite) {
                              box.add({
                                "title": article.title,
                                "url": article.url
                              });
                              print("Successfully added");
                            } else {
                              box.delete(article.title);
                              print("Successfully deleted");
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
