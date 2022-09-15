import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/business_logic/articles_cubit/articles_cubit.dart';
import 'package:news_app/business_logic/articles_cubit/articles_states.dart';
import '../../widgets/custom_circular_progress.dart';
import '../../widgets/news_builder.dart';

class BusinessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List articles = ArticlesCubit.get(context).businessArticles;
        return articles.length > 0
            ? NewsBuilder(articles: articles)
            : CustomCircularProgress();
      },
    );
  }
}
