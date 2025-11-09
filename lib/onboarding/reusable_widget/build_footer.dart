import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/l10n/app_localizations.dart';

import '../../Utils/color_App.dart';
import '../../Utils/text_app.dart';

class BuildFooter extends StatelessWidget {
  BuildFooter({
    super.key,
    this.height = .37,
    this.onBack ,
    this.isLastPage = false,
    required this.onPressed,
    required this.context,
    required this.local,
    required this.haveBack,
    required this.titleString,
    required this.bodyString,
    this.elevated = 'Next',
  });
  VoidCallback onPressed ;
  VoidCallback? onBack ;
  double height;
  bool isLastPage;
  BuildContext context;
  AppLocalizations local;
  bool haveBack;
  String titleString;
  String bodyString;
  String elevated;
  Text title(String titleString) {
    return Text(titleString, style: TextApp.bold24White);
  }

  Text body(String bodyString) {
    return Text(
      bodyString,
      style: TextApp.regular20White,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: haveBack ? context.height * height : context.height * .3,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorApp.primaryBlack,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsetsGeometry.directional(
        bottom: 0,
        start: context.width * .04,
        end: context.width * .04,
        top: context.height * .035,
      ),
      child: Column(
        spacing: context.height * .02,
        children: [
          Column(
            children: [
              title(titleString),
              isLastPage ? SizedBox():SizedBox(height: context.height* .02,),
              isLastPage ? SizedBox():body(bodyString),
            ],
          ),
          Column(
            spacing: context.height * .015,
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: ColorApp.primaryWallow,
                  padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                  minimumSize: Size(double.infinity, 0),
                ),
                child: Text(elevated, style: TextApp.semiBold20black),
              ),
              haveBack
                  ? ElevatedButton(
                      onPressed: onBack,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: ColorApp.primaryWallow,
                        padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                        minimumSize: Size(double.infinity, 0),
                      ),
                      child: Text(local.back, style: TextApp.semiBold20black),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
