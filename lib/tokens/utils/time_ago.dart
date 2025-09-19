import 'package:dart_date/dart_date.dart';
import 'package:dice_bag/i18n/gen/strings.g.dart';

String timeAgo(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);
  switch (diff.inHours) {
    case >= 24:
      return date.format(
        "MMM dd, HH:mm aa",
        LocaleSettings.currentLocale.languageCode,
      );
    case >= 1:
      return date.format(
        "HH:mm aa",
        LocaleSettings.currentLocale.languageCode,
      );

    default:
      return date.timeago(
        clock: now,
        locale: LocaleSettings.currentLocale.languageCode,
      );
  }
  /* final diff = now.timeago(
    clock: DateTime.now(),
    locale: LocaleSettings.currentLocale.languageCode,
  ); */

  /* final diff = now.difference(date);
  if (diff.inDays > 365) {
    return '${diff.inDays ~/ 365} years ago';
  } else if (diff.inDays > 30) {
    return '${diff.inDays ~/ 30} months ago';
  } else if (diff.inDays > 0) {
    return '${diff.inDays} days ago';
  } else if (diff.inHours > 0) {
    return '${diff.inHours} hours ago';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes} minutes ago';
  } else if (diff.inSeconds > 0) {
    return '${diff.inSeconds} seconds ago';
  } */
}
