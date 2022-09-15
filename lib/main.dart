import 'package:flutter/material.dart';

import 'domain/constants/constants.dart';
import 'data/local/cache_helper.dart';
import 'data/network/remote/dio_helper.dart';
import 'news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  runApp(NewsApp(isDark: CacheHelper.getData(key: spAppThemeKey)));
}
