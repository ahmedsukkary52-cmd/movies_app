import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_text_field.dart';
import 'package:team_flutter_6_movie_app/ui/search/search_item.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  String textSearch = '';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.02,
            horizontal: context.width * 0.03,
          ),
          child: Column(
            children: [
              CustomTextField(
                prefixIconName: Image.asset(PathImage.searchUnselected),
                hintText: "Search",
                onChange: (text) {
                  widget.textSearch = text;
                  setState(() {});
                },
              ),
              Expanded(child: SearchItem(searchText: widget.textSearch)),
            ],
          ),
        ),
      ),
    );
  }
}