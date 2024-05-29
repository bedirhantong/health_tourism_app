import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class AwesomeSnackbar extends SnackBar {
  final String title;
  final String message;

  AwesomeSnackbar(this.title, this.message, {super.key})
      : super(
          elevation: 20,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            color: Colors.blue,
            title: title,
            message: message,
            contentType: ContentType.help,
          ),
        );
}
