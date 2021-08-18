import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'business_screen.dart';
import 'science_screen.dart';
import 'sports_screen.dart';
import 'technology_screen.dart';
import 'health_screen.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: TabBarView(
            children: <Widget>[
              BusinessScreen(),
              ScienceScreen(),
              SportsScreen(),
              TechnologyScreen(),
              HealthScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
