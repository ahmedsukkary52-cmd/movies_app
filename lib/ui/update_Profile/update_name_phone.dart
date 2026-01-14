import 'package:flutter/material.dart';

import '../../Utils/color_App.dart';
import '../../Utils/text_app.dart';

class UpdateNamePhone extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  Widget? prefixIcon;
  UpdateNamePhone({super.key, required this.controller,this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorApp.grayColor,
      ),
      child: TextFormField(
        controller: controller,

        style: TextApp.regular20White,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(15));
  }
}
