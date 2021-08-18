import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'package:news_app/screens/news/news_screen.dart';
import 'package:news_app/screens/person/person_screen.dart';
import 'package:news_app/screens/search/search_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.setData(key: 'isDark', isDark: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: 'Person',
    ),
  ];

  List<Widget> screens = [
    NewsScreen(),
    SearchScreen(),
    PersonScreen(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavBarState());
  }

  getNews() {
    getBusiness();
    getScience();
    getSports();
    getTechnology();
    getHealth();
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(AppGetBusinessNewsLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'GB',
      'category': 'business',
      'apiKey': 'fc1f6d72a3014df88c0d0d20d9f3e30c'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]);
      emit(AppGetBusinessNewsSuccessState());
    }).catchError((error) {
      emit(AppGetBusinessNewsErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(AppGetScienceNewsLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'GB',
      'category': 'science',
      'apiKey': 'fc1f6d72a3014df88c0d0d20d9f3e30c'
    }).then((value) {
      science = value.data['articles'];
      print(science[0]);
      emit(AppGetScienceNewsSuccessState());
    }).catchError((error) {
      emit(AppGetScienceNewsErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(AppGetSportsNewsLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'GB',
      'category': 'sports',
      'apiKey': 'fc1f6d72a3014df88c0d0d20d9f3e30c'
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]);
      emit(AppGetSportsNewsSuccessState());
    }).catchError((error) {
      emit(AppGetSportsNewsErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> technology = [];

  void getTechnology() {
    emit(AppGetTechnologyNewsLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'GB',
      'category': 'technology',
      'apiKey': 'fc1f6d72a3014df88c0d0d20d9f3e30c'
    }).then((value) {
      technology = value.data['articles'];
      print(technology[0]);
      emit(AppGetTechnologyNewsSuccessState());
    }).catchError((error) {
      emit(AppGetTechnologyNewsErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(AppGetHealthNewsLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'GB',
      'category': 'health',
      'apiKey': 'fc1f6d72a3014df88c0d0d20d9f3e30c'
    }).then((value) {
      health = value.data['articles'];
      print(health[0]);
      emit(AppGetHealthNewsSuccessState());
    }).catchError((error) {
      emit(AppGetHealthNewsErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> search = [];

  void getSearch(String text) {
    emit(AppGetSearchNewsLoadingState());
    search = [];
    DioHelper.getData(
      path: 'v2/everything',
      query: {'q': '$text', 'apiKey': 'fc1f6d72a3014df88c0d0d20d9f3e30c'},
    ).then((value) {
      search = value.data['articles'];
      print('Searchhh ${search[0]}');
      emit(AppGetSearchNewsSuccessState());
    }).catchError((error) {
      emit(AppGetSearchNewsErrorState(error.toString()));
      print(error.toString());
    });
  }
}

// 1st APIKey: 98b5c575fd544649afd3c12098126a5b
// 2nd APIKey: fc1f6d72a3014df88c0d0d20d9f3e30c
