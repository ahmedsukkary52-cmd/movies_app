abstract class TokenState {}

class TokenInitial extends TokenState {}

class TokenLoaded extends TokenState {
  String? token;

  TokenLoaded({required this.token});
}
