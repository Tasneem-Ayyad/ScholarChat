import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// هاي بستخمها اذا بدي اعرض ماسيج باي مكان لاشي معين
void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
