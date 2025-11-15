import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_index_avatars_state.dart';

class SelectIndexAvatarsCubit extends Cubit<SelectIndexAvatarsState> {
  SelectIndexAvatarsCubit() : super(SelectIndexAvatarsInitial());

  void updateSelectIndexAvatars(int newIndex) {
    emit(UpdateSelectIndexAvatars(newIndex));
  }
}
