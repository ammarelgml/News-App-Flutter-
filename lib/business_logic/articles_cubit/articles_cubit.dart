import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/data/network/remote/dio_helper.dart';
import 'package:news_app/data/responses/articles_response.dart';
import 'package:news_app/domain/models/article.dart';
import '../../data/network/end_points.dart';
import '../../data/requests/articles_request.dart';
import '../../data/requests/search_articles_request.dart';
import 'articles_states.dart';

class ArticlesCubit extends Cubit<ArticlesStates> {
  ArticlesCubit() : super(InitialState());

  static ArticlesCubit get(context) => BlocProvider.of(context);

  List<Article> businessArticles = [];

  void getBusiness() async {
    emit(GetBusinessNewsLoadingState());
    businessArticles.clear();
    (await DioHelper.getData(
      url: epGetNews,
      query: ArticlesRequest(country: 'GB', category: 'business').toJson(),
    ))
        .fold(
      (failure) => emit(GetBusinessNewsErrorState(failure.message)),
      (articlesMap) {
        ArticlesResponse articlesResponse =
            ArticlesResponse.fromJson(articlesMap);
        businessArticles.addAll(articlesResponse.articles);
        emit(GetBusinessNewsSuccessState());
      },
    );
  }

  List<Article> scienceArticles = [];

  void getScience() async {
    scienceArticles.clear();
    emit(GetScienceNewsLoadingState());
    (await DioHelper.getData(
      url: epGetNews,
      query: ArticlesRequest(country: 'GB', category: 'science').toJson(),
    ))
        .fold(
      (failure) => emit(GetScienceNewsErrorState(failure.message)),
      (articlesMap) {
        ArticlesResponse articlesResponse =
            ArticlesResponse.fromJson(articlesMap);
        scienceArticles.addAll(articlesResponse.articles);
        emit(GetScienceNewsSuccessState());
      },
    );
  }

  List<Article> sportsArticles = [];

  void getSports() async {
    sportsArticles.clear();
    emit(GetSportsNewsLoadingState());
    (await DioHelper.getData(
      url: epGetNews,
      query: ArticlesRequest(country: 'GB', category: 'sports').toJson(),
    ))
        .fold(
      (failure) => emit(GetSportsNewsErrorState(failure.message)),
      (articlesMap) {
        ArticlesResponse articlesResponse =
            ArticlesResponse.fromJson(articlesMap);
        sportsArticles.addAll(articlesResponse.articles);
        emit(GetSportsNewsSuccessState());
      },
    );
  }

  List<dynamic> technologyArticles = [];

  void getTechnology() async {
    technologyArticles.clear();
    emit(GetTechnologyNewsLoadingState());
    (await DioHelper.getData(
      url: epGetNews,
      query: ArticlesRequest(country: 'GB', category: 'technology').toJson(),
    ))
        .fold(
      (failure) => emit(GetTechnologyNewsErrorState(failure.message)),
      (articlesMap) {
        ArticlesResponse articlesResponse =
            ArticlesResponse.fromJson(articlesMap);
        technologyArticles.addAll(articlesResponse.articles);
        emit(GetTechnologyNewsSuccessState());
      },
    );
  }

  List<dynamic> healthArticles = [];

  void getHealth() async {
    healthArticles.clear();
    emit(GetHealthNewsLoadingState());
    (await DioHelper.getData(
      url: epGetNews,
      query: ArticlesRequest(country: 'GB', category: 'health').toJson(),
    ))
        .fold(
      (failure) => emit(GetHealthNewsErrorState(failure.message)),
      (articlesMap) {
        ArticlesResponse articlesResponse =
            ArticlesResponse.fromJson(articlesMap);
        healthArticles.addAll(articlesResponse.articles);
        emit(GetHealthNewsSuccessState());
      },
    );
  }

  List<Article> searchArticles = [];

  void getSearch(String query) async {
    emit(GetSearchNewsLoadingState());
    searchArticles.clear();
    (await DioHelper.getData(
      url: epSearchNews,
      query: SearchArticlesRequest(q: query).toJson(),
    ))
        .fold(
      (failure) => emit(GetSearchNewsErrorState(failure.message)),
      (articlesMap) {
        ArticlesResponse articlesResponse =
            ArticlesResponse.fromJson(articlesMap);
        searchArticles.addAll(articlesResponse.articles);
        emit(GetSearchNewsSuccessState());
      },
    );
  }
}
