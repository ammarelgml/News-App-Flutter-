import 'package:flutter/material.dart';
import 'article_item.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({
    @required this.articles,
  });

  final List articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          ArticleItem(article: articles[index], context: context),
      separatorBuilder: (context, index) => SizedBox(),
      itemCount: articles.length,
    );
  }
}
