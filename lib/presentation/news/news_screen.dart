import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/articles_cubit/articles_cubit.dart';
import '../../business_logic/articles_cubit/articles_states.dart';
import 'views/science_view.dart';
import 'views/technology_view.dart';
import 'views/business_view.dart';
import 'views/sports_view.dart';
import 'views/health_view.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlesCubit, ArticlesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ArticlesCubit.get(context);
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(8.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: TabBar(
                      tabs: [
                        Tab(child: Icon(Icons.business_center_outlined)),
                        Tab(child: Icon(Icons.science_outlined)),
                        Tab(child: Icon(Icons.sports_soccer_outlined)),
                        Tab(child: Icon(CupertinoIcons.lightbulb)),
                        Tab(child: Icon(CupertinoIcons.heart)),
                      ],
                      onTap: (index) {
                        onTapIndexChanged(index, cubit);
                      },
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: TabBarView(
                  children: [
                    BusinessView(),
                    ScienceView(),
                    SportsView(),
                    TechnologyView(),
                    HealthView(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  onTapIndexChanged(int index, ArticlesCubit cubit) {
    switch (index) {
      case 0:
        if (cubit.businessArticles.isEmpty) {
          cubit.getBusiness();
        }
        break;
      case 1:
        if (cubit.scienceArticles.isEmpty) {
          cubit.getScience();
        }
        break;
      case 2:
        if (cubit.sportsArticles.isEmpty) {
          cubit.getSports();
        }
        break;
      case 3:
        if (cubit.technologyArticles.isEmpty) {
          cubit.getTechnology();
        }
        break;
      case 4:
        if (cubit.healthArticles.isEmpty) {
          cubit.getHealth();
        }
        break;
    }
  }
}
