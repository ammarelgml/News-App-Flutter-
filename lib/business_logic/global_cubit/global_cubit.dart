import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/constants/constants.dart';
import '../../data/local/cache_helper.dart';
import '../../presentation/news/news_screen.dart';
import '../../presentation/person/person_screen.dart';
import '../../presentation/search/search_screen.dart';
import 'global_states.dart';

class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() : super(InitialState());

  static GlobalCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.setData(key: spAppThemeKey, isDark: isDark);
      emit(ChangeThemeModeState());
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
      icon: Icon(Icons.menu),
      label: 'More',
    ),
  ];

  List<Widget> screens = [
    NewsScreen(),
    SearchScreen(),
    PersonScreen(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
