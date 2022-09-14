import 'package:flutter/material.dart';

import 'package:news_app/business_logic/cubit.dart';
import '../../constants/constants.dart';

class CustomCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: NewsCubit.get(context).isDark
            ? AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent)
            : AlwaysStoppedAnimation<Color>(kPrimaryColor),
      ),
    );
  }
}
