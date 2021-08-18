abstract class NewsStates {}

class AppInitialState extends NewsStates {}

class AppChangeModeState extends NewsStates {}

class AppBottomNavBarState extends NewsStates {}

class AppGetBusinessNewsLoadingState extends NewsStates {}

class AppGetBusinessNewsSuccessState extends NewsStates {}

class AppGetBusinessNewsErrorState extends NewsStates {
  final String error;
  AppGetBusinessNewsErrorState(this.error);
}

class AppGetSportsNewsLoadingState extends NewsStates {}

class AppGetSportsNewsSuccessState extends NewsStates {}

class AppGetSportsNewsErrorState extends NewsStates {
  final String error;
  AppGetSportsNewsErrorState(this.error);
}

class AppGetScienceNewsLoadingState extends NewsStates {}

class AppGetScienceNewsSuccessState extends NewsStates {}

class AppGetScienceNewsErrorState extends NewsStates {
  final String error;
  AppGetScienceNewsErrorState(this.error);
}

class AppGetTechnologyNewsLoadingState extends NewsStates {}

class AppGetTechnologyNewsSuccessState extends NewsStates {}

class AppGetTechnologyNewsErrorState extends NewsStates {
  final String error;
  AppGetTechnologyNewsErrorState(this.error);
}

class AppGetHealthNewsLoadingState extends NewsStates {}

class AppGetHealthNewsSuccessState extends NewsStates {}

class AppGetHealthNewsErrorState extends NewsStates {
  final String error;
  AppGetHealthNewsErrorState(this.error);
}

class AppGetSearchNewsLoadingState extends NewsStates {}

class AppGetSearchNewsSuccessState extends NewsStates {}

class AppGetSearchNewsErrorState extends NewsStates {
  final String error;
  AppGetSearchNewsErrorState(this.error);
}
