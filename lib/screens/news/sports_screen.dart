import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../../widgets/news_builder.dart';
import '../../widgets/custom_circular_progress.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List articles = NewsCubit.get(context).sports;
        return articles.length > 0
            ? NewsBuilder(articles: articles)
            : CustomCircularProgress();
      },
    );
  }
}
