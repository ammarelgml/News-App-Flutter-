import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/business_logic/articles_cubit/articles_cubit.dart';
import 'package:news_app/business_logic/articles_cubit/articles_states.dart';
import '../../domain/constants/fake_trending_data.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/news_builder.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List articles = ArticlesCubit.get(context).searchArticles;

        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                searchController: searchController,
                onChanged: (value) {
                  ArticlesCubit.get(context).getSearch(value);
                },
              ),
              articles.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Searches",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(height: 8),
                          Wrap(
                            children: [
                              for (var items in recentSearches)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Chip(
                                    label: Text(
                                      items,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    padding: const EdgeInsets.all(8.0),
                                    onDeleted: () {},
                                    deleteIconColor: Colors.grey,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    elevation: 8,
                                    shadowColor:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Expanded(child: NewsBuilder(articles: articles)),
            ],
          ),
        );
      },
    );
  }
}
