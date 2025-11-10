import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';

import '../../Utils/color_App.dart';
import '../../cubit/select_index_avatars_cubit.dart';
import '../../model/avatars_model.dart';
import 'avatars_image.dart';

void bottomSheet(BuildContext parentContext) {
  showModalBottomSheet(
    backgroundColor: ColorApp.transparent,
    context: parentContext,
    builder: (context) {
      return BlocProvider.value(
        value: parentContext.read<SelectIndexAvatarsCubit>(),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: parentContext.width * 0.92,
              height: parentContext.height * 0.45,
              margin: EdgeInsets.only(
                left: parentContext.width * 0.03,
                right: parentContext.width * 0.03,
                bottom: parentContext.height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: ColorApp.grayColor,
              ),
              child:
              BlocBuilder<
                  SelectIndexAvatarsCubit,
                  SelectIndexAvatarsState
              >(
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: parentContext.height * 0.03,
                      horizontal: parentContext.width * 0.03,
                    ),
                    itemCount: AvatarsModel.avatars.length,
                    itemBuilder: (context, index) {
                      final cubit = context
                          .read<SelectIndexAvatarsCubit>();
                      final state = cubit.state;
                      return InkWell(
                        onTap: () {
                          cubit.updateSelectIndexAvatars(index);
                          Navigator.pop(context);
                        },
                        child: AvatarsImage(
                          image: AvatarsModel.avatars[index],
                          isSelect: state.selectIndexAvatars == index,
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      );
    },
  );
}