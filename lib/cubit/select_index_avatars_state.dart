part of 'select_index_avatars_cubit.dart';

@immutable
sealed class SelectIndexAvatarsState {
  final int selectIndexAvatars;

  SelectIndexAvatarsState(this.selectIndexAvatars);
}

final class SelectIndexAvatarsInitial extends SelectIndexAvatarsState {
  SelectIndexAvatarsInitial() : super(0);
}

class UpdateSelectIndexAvatars extends SelectIndexAvatarsState {
  UpdateSelectIndexAvatars(super.selectIndexAvatars);
}
