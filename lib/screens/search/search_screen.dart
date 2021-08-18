import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/widgets/custom_circular_progress.dart';

import '../../widgets/custom_text_field.dart';
import '../../widgets/news_builder.dart';

// https://newsapi.org/v2/everything?q=tesla&apiKey=98b5c575fd544649afd3c12098126a5b

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List articles = NewsCubit.get(context).search;

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomTextField(
                searchController: searchController,
                onChanged: (value) {
                  NewsCubit.get(context).getSearch(value);
                },
              ),
            ),
            Expanded(child: NewsBuilder(articles: articles))
          ],
        );
      },
    );
  }
}
