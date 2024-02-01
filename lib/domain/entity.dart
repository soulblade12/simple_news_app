class News {

  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  String content;
  late bool isFavorite;

  News(
      {
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    this.isFavorite = false,
  }
  );

  factory News.fromJson(Map<String, dynamic> json) => News(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    content: json["content"],
  );
}