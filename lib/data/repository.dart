import 'dart:convert';
import "package:news_app/data/datasource.dart";
import "package:news_app/domain/entity.dart";



  var APIDataSource = GetData();

  Future<List<News>> fetchNews() async{
    var jsonNews = jsonDecode(await APIDataSource.GetNewsData())['articles'];
    var listNews = <News>[];
    for (var i = 0; i < jsonNews.length && i<13; i++) {
      listNews.add(News.fromJson(jsonNews[i]));
    }

    return listNews;
  }
