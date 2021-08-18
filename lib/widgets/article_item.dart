import 'package:flutter/material.dart';
import 'package:news_app/screens/webview/webview_screen.dart';

import '../constants.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({@required this.article, @required this.context});

  final Map article;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(url: article['url'])));
      },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getImage(),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(fontSize: 14, color: kDarkGray),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getImage() {
    if (article['urlToImage'] != null) {
      return Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Opacity(
        opacity: .2,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('images/blue-warning.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }
}
