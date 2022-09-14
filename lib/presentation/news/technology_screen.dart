import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/business_logic/cubit.dart';
import 'package:news_app/business_logic/states.dart';
import '../widgets/custom_circular_progress.dart';
import '../widgets/news_builder.dart';

class TechnologyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List articles = NewsCubit.get(context).technology;
        return articles.length > 0
            ? NewsBuilder(articles: articles)
            : CustomCircularProgress();
      },
    );
  }
}
