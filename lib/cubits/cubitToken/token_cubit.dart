import 'package:bloc/bloc.dart';
import 'package:team_flutter_6_movie_app/cubits/cubitToken/token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit() : super(TokenInitial());

  //todo save token
  void saveToken(String newToken) {
    emit(TokenLoaded(token: newToken));
  }

  //todo clean token
  void cleanToken() {
    emit(TokenInitial());
  }
}
