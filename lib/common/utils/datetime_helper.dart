import 'package:easy_localization/easy_localization.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

extension DateTimeExtensionNullable on DateTime? {
  String? format() {
    if (this == null) {
      return null;
    } else {
      return Jalali.fromDateTime(this!).formatCompactDate();
    }
    // if (AuthBloc().calendar == CalendarEnum.jalali) {
    // return Jalali.fromDateTime(this!).formatCompactDate();
    // } else {
    //   return DateFormat('yyyy/MM/dd').format(this);
    // }
  }

/*
  String toRelativeTime() {
    DateTime dateTime = DateTime.parse(toIso8601String());
    Duration diff = DateTime.now().difference(dateTime);
    if (diff.inSeconds < 45) {
      return LocaleKeys.common_relativeTime_fewMoments.tr();
    } else if (diff.inSeconds >= 45 && diff.inSeconds < 90) {
      return LocaleKeys.common_relativeTime_aMinute.tr();
    } else if (diff.inSeconds >= 90 && diff.inMinutes < 45) {
      return LocaleKeys.common_relativeTime_minutes
          .tr(namedArgs: {'m': diff.inMinutes.toString()});
    } else if (diff.inMinutes >= 45 && diff.inMinutes < 90) {
      return LocaleKeys.common_relativeTime_anHour.tr();
    } else if (diff.inMinutes >= 90 && diff.inHours < 22) {
      return LocaleKeys.common_relativeTime_hours
          .tr(namedArgs: {'h': diff.inHours.toString()});
    } else if (diff.inHours >= 22 && diff.inHours < 36) {
      return LocaleKeys.common_relativeTime_aDay.tr();
    } else if (diff.inHours >= 36 && diff.inDays < 26) {
      return LocaleKeys.common_relativeTime_days
          .tr(namedArgs: {'d': diff.inDays.toString()});
    } else if (diff.inDays >= 26 && diff.inDays < 45) {
      return LocaleKeys.common_relativeTime_aMonth.tr();
    } else if (diff.inDays >= 45 && diff.inDays < 320) {
      return LocaleKeys.common_relativeTime_months
          .tr(namedArgs: {'m': diff.inMonths.toString()});
    } else if (diff.inDays >= 320 && diff.inDays < 548) {
      return LocaleKeys.common_relativeTime_aYear.tr();
    } else {
      return LocaleKeys.common_relativeTime_years
          .tr(namedArgs: {'y': diff.inYears.toString()});
    }
  }
*/
}

extension DateTimeHelper on DateTime {
  String timeFormat() => DateFormat('hh:mm').format(this);
}
