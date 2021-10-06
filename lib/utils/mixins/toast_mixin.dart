import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_enquirer/constants/color_constants.dart';

mixin ToastMixin {
  showErrorToast(String content) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        "$content",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: ColorConstants.red,
    );
    Okito.showSnackBar(snackBar: snackBar);
  }

  showWarningToast(String content) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        "$content",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: ColorConstants.orangeColor,
    );
    Okito.showSnackBar(snackBar: snackBar);
  }

  showSuccessToast(String content) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        "$content",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: ColorConstants.greenColor,
    );
    Okito.showSnackBar(snackBar: snackBar);
  }
}
