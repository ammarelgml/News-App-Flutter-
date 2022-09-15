abstract class ArticlesStates {}

class InitialState extends ArticlesStates {}

class GetBusinessNewsLoadingState extends ArticlesStates {}

class GetBusinessNewsSuccessState extends ArticlesStates {}

class GetBusinessNewsErrorState extends ArticlesStates {
  final String error;

  GetBusinessNewsErrorState(this.error);
}

class GetSportsNewsLoadingState extends ArticlesStates {}

class GetSportsNewsSuccessState extends ArticlesStates {}

class GetSportsNewsErrorState extends ArticlesStates {
  final String error;

  GetSportsNewsErrorState(this.error);
}

class GetScienceNewsLoadingState extends ArticlesStates {}

class GetScienceNewsSuccessState extends ArticlesStates {}

class GetScienceNewsErrorState extends ArticlesStates {
  final String error;

  GetScienceNewsErrorState(this.error);
}

class GetTechnologyNewsLoadingState extends ArticlesStates {}

class GetTechnologyNewsSuccessState extends ArticlesStates {}

class GetTechnologyNewsErrorState extends ArticlesStates {
  final String error;

  GetTechnologyNewsErrorState(this.error);
}

class GetHealthNewsLoadingState extends ArticlesStates {}

class GetHealthNewsSuccessState extends ArticlesStates {}

class GetHealthNewsErrorState extends ArticlesStates {
  final String error;

  GetHealthNewsErrorState(this.error);
}

class GetSearchNewsLoadingState extends ArticlesStates {}

class GetSearchNewsSuccessState extends ArticlesStates {}

class GetSearchNewsErrorState extends ArticlesStates {
  final String error;

  GetSearchNewsErrorState(this.error);
}
