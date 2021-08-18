import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(Icons.brightness_4_outlined, size: 28),
                onPressed: () {
                  NewsCubit.get(context).changeMode();
                  print(' ${NewsCubit.get(context).isDark}');
                },
              )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 54.0),
            child: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              items: cubit.bottomItems,
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
