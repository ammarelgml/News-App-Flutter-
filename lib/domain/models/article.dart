import 'source.dart';

class Article {
  String? author;
  String? content;
  String? description;
  String publishedAt;
  Source? source;
  String title;
  String url;
  String? urlToImage;

  Article({
    this.author,
    this.content,
    this.description,
    required this.publishedAt,
    required this.source,
    required this.title,
    required this.url,
    this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] != null ? json['author'] : null,
      content: json['content'] != null ? json['content'] : null,
      description: json['description'] != null ? json['description'] : null,
      publishedAt: json['publishedAt'],
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'] != null ? json['urlToImage'] : null,
    );
  }
}
