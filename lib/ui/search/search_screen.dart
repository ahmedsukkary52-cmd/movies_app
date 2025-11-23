import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/assets_app.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';
import 'package:team_flutter_6_movie_app/ui/authintication/rusable_widget/custom_text_field.dart';
TextEditingController searchController = TextEditingController();
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                  obsecureText: false,
                  prefixIconName: Image.asset(PathImage.searchUnselected),
                  hintText: AppLocalizations.of(context)!.search,
                  controller: searchController,
                  validator: (text) {
                    if(text == null || text.trim().isEmpty){
                      return 'You Can Search';
                    }
                    return null ;
                  },
              ),
              SizedBox(
                height:  context.height*0.3,
              ),
              SizedBox(
                  height: context.height*0.2,
                  width: context.width*0.04,
                  child: Image.asset(PathImage.emptyImage,alignment: Alignment.center)
              )
            ],
          ),
        ),
      ),
    );
  }
}
