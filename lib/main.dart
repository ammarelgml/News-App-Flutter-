import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit.dart';
import 'business_logic/states.dart';
import 'network/remote/dio_helper.dart';
import 'network/local/cache_helper.dart';
import 'presentation/home_screen.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  MyApp({@required this.isDark});

  final isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..changeMode(fromShared: isDark),
        ),
        BlocProvider(create: (context) => NewsCubit()..getNews()),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ThemeData().scaffoldBackgroundColor,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: ThemeData().scaffoldBackgroundColor,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: kPrimaryDarkColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(color: kPrimaryDarkColor),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: kPrimaryColor,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedIconTheme: IconThemeData(size: 28),
                backgroundColor: ThemeData().scaffoldBackgroundColor,
                elevation: 0.0,
              ),
              tabBarTheme: TabBarTheme(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: kPrimaryColor,
                ),
                unselectedLabelColor: Colors.grey,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Color(0xFF333739),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFF333739),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color(0xFF333739),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme:
                    IconThemeData(color: ThemeData().scaffoldBackgroundColor),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.lightBlueAccent,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                backgroundColor: Color(0xFF333739),
                elevation: 0.0,
              ),
              tabBarTheme: TabBarTheme(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.lightBlueAccent,
                ),
                unselectedLabelColor: Colors.grey,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
