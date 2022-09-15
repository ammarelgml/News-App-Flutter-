import '../../domain/constants/constants.dart';

class ArticlesRequest {
  final String country;
  final String category;
  final String apiKey;

  ArticlesRequest({
    required this.country,
    required this.category,
    this.apiKey = newsApiKey,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['category'] = category;
    map['apiKey'] = apiKey;
    return map;
  }
}
