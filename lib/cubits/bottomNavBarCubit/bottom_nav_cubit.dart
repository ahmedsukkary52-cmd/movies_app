import 'package:bloc/bloc.dart';

class NavigationState {
  final int currentIndex;
  final String? selectedGenre;

  NavigationState({
    required this.currentIndex,
    this.selectedGenre,
  });

  NavigationState copyWith({
    int? currentIndex,
    String? selectedGenre,
  }) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      selectedGenre: selectedGenre ?? this.selectedGenre,
    );
  }
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(currentIndex: 0));

  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void selectGenre(String genre) {
    emit(state.copyWith(selectedGenre: genre));
  }
}
