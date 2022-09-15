import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/articles_cubit/articles_cubit.dart';

import 'package:news_app/business_logic/global_cubit/global_cubit.dart';
import 'package:news_app/business_logic/global_cubit/global_states.dart';
import 'package:news_app/presentation/theme/app_themes.dart';
import 'presentation/home_screen.dart';

class NewsApp extends StatelessWidget {
  NewsApp({required this.isDark});

  final isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GlobalCubit()..changeMode(fromShared: isDark)),
        BlocProvider(create: (context) => ArticlesCubit()..getBusiness())
      ],
      child: BlocConsumer<GlobalCubit, GlobalStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: GlobalCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
