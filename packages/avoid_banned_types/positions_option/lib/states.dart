// State types - defining these is fine
sealed class AppState {}

class LoadingState extends AppState {}

class ErrorState extends AppState {
  final String message;
  ErrorState(this.message);
}

class SuccessState extends AppState {
  final String data;
  SuccessState(this.data);
}
