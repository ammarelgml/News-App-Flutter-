import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/business_logic/global_cubit/global_cubit.dart';
import 'package:news_app/business_logic/global_cubit/global_states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalStates>(
        listener: (context, state) {},
        builder: (context, state) {
          GlobalCubit cubit = GlobalCubit.get(context);
          return Scaffold(
              appBar: AppBar(title: Text('Latest News'), actions: [
                IconButton(
                    icon: Icon(Icons.brightness_4_outlined, size: 28),
                    onPressed: () {
                      GlobalCubit.get(context).changeMode();
                    })
              ]),
              bottomNavigationBar: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 54.0),
                  child: BottomNavigationBar(
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeCurrentIndex(index);
                    },
                    items: cubit.bottomItems,
                  )),
              body: cubit.screens[cubit.currentIndex]);
        });
  }
}
