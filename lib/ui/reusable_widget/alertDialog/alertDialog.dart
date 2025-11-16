import 'package:flutter/material.dart';
import 'package:team_flutter_6_movie_app/Utils/color_App.dart';
import 'package:team_flutter_6_movie_app/Utils/extension/extension.dart';
import 'package:team_flutter_6_movie_app/Utils/text_app.dart';

class ShowAlertDialog {
  static void showLoading({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        alignment: AlignmentGeometry.center,
        backgroundColor: ColorApp.primaryBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: ColorApp.grayColor)
        ),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children:  [
            CircularProgressIndicator(color: ColorApp.primaryWallow,),
            SizedBox(width: context.width* .03),
            Text('Please wait...',style: TextApp.regular20White,),
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName,style: TextApp.regular20White),
        ),
      );
    }

    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,style: TextApp.regular20White),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadiusGeometry.circular(16),
          side: BorderSide(color: ColorApp.grayColor)
        ),
        alignment: Alignment.center,
        backgroundColor: ColorApp.primaryBlack,
        title: title != null ? Text(title,style: TextApp.regular20White,) : null,
        content: Text(message,style: TextApp.regular20White),
        actions: actions.isNotEmpty ? actions : null,
      ),
    );
  }
}
