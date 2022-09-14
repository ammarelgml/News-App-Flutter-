import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/business_logic/cubit.dart';
import 'package:news_app/business_logic/states.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/news_builder.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

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
