import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/local_bloc.dart';
import '../Bloc/local_event.dart';

void toggleLocale(BuildContext context) {
  final bloc = context.read<LocaleBloc>();
  final current = bloc.state.locale.languageCode;
  bloc.add(ChangeLocale(current == 'en' ? const Locale('ar') : const Locale('en')));
}
