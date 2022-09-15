import '../../../domain/models/article.dart';

class ArticlesResponse {
  List<Article> articles;
  String status;
  int totalResults;

  ArticlesResponse({
    required this.articles,
    required this.status,
    required this.totalResults,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return ArticlesResponse(
      articles: (json['articles'] as List<dynamic>?) != null
          ? (json['articles'] as List<dynamic>?)!
              .map((articleMap) =>
                  Article.fromJson(articleMap as Map<String, dynamic>))
              .toList()
          : [],
      status: json['status'],
      totalResults: json['totalResults'],
    );
  }
}
