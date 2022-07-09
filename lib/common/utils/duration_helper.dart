import 'package:easy_localization/easy_localization.dart';
import 'package:s_house/common/localization/locale_keys.g.dart';

extension DurationHelper on Duration {
  int get inRoundMinutes => (inSeconds / 60).round();

  int get inRoundHours => (inMinutes / 60).round();

  int get inRoundDays => (inHours / 24).round();

  int get inRoundMonths => (inDays / 30).round();

  int get inRoundYears => (inDays / 365).round();

  String toRelativeTime() {
    if (inSeconds < 45) {
      return LocaleKeys.common_relativeTime_fewMoments.tr();
    } else if (inSeconds >= 45 && inSeconds < 90) {
      return LocaleKeys.common_relativeTime_aMinute.tr();
    } else if (inSeconds >= 90 && inMinutes < 45) {
      return LocaleKeys.common_relativeTime_minutes
          .tr(namedArgs: {'m': inRoundMinutes.toString()});
    } else if (inMinutes >= 45 && inMinutes < 90) {
      return LocaleKeys.common_relativeTime_anHour.tr();
    } else if (inMinutes >= 90 && inHours < 22) {
      return LocaleKeys.common_relativeTime_hours
          .tr(namedArgs: {'h': inRoundHours.toString()});
    } else if (inHours >= 22 && inHours < 36) {
      return LocaleKeys.common_relativeTime_aDay.tr();
    } else if (inHours >= 36 && inDays < 26) {
      return LocaleKeys.common_relativeTime_days
          .tr(namedArgs: {'d': inRoundDays.toString()});
    } else if (inDays >= 26 && inDays < 45) {
      return LocaleKeys.common_relativeTime_aMonth.tr();
    } else if (inDays >= 45 && inDays < 320) {
      return LocaleKeys.common_relativeTime_months
          .tr(namedArgs: {'m': inRoundMonths.toString()});
    } else if (inDays >= 320 && inDays < 548) {
      return LocaleKeys.common_relativeTime_aYear.tr();
    }
    return LocaleKeys.common_relativeTime_years
        .tr(namedArgs: {'y': inRoundYears.toString()});
  }
}
