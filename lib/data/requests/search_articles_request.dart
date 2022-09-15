import '../../domain/constants/constants.dart';

class SearchArticlesRequest {
  final String q;
  final String apiKey;

  SearchArticlesRequest({
    required this.q,
    this.apiKey = newsApiKey,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['q'] = q;
    map['apiKey'] = apiKey;
    return map;
  }
}
