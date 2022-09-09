import 'package:garden_of_eve/utils/time_ago.dart';
import 'package:intl/intl.dart';

class Format {
  static String date(DateTime dt) {
    return DateFormat.yMMMMd().format(dt);
  }

  static String dateTime(DateTime dt) {
    return '${DateFormat.yMMMMd().format(dt)} (${DateFormat.jm().format(dt)})';
  }

  static String timeAgo(DateTime dt) {
    final dateString = DateFormat('dd-MM-yyyy h:mma').format(dt);
    return TimeAgo.timeAgoSinceDate(dateString, dt);
  }

  static String amount(double amount) {
    NumberFormat f = NumberFormat("#,##0.00", "en_US");
    return f.format(amount);
  }

  static String amountShort(double amount) {
    NumberFormat f = NumberFormat("#,##0", "en_US");
    return f.format(amount);
  }
}
