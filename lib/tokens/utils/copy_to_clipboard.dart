import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard(
  String value, {
  required BuildContext context,
}) {
  setClipboardData(value);
  // final t = AppLocalizations.of(context);
  final t = strings.utils.copyToClipboard;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(t.success),
      duration: Duration(seconds: 2),
    ),
  );
}

void setClipboardData(String value) {
  Clipboard.setData(ClipboardData(text: value));
}
