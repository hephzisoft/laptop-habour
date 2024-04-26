import 'package:intl/intl.dart';

class AppUtils {
  static String formatNumberWithCommas(dynamic number) {
    final formatter = NumberFormat.decimalPattern('en_US');

    // Check if number is already a String
    if (number is String) {
      // Handle potential non-numeric strings, if needed
      try {
        number = double.parse(number);
      } catch (e) {
        return number; // Return original string if not a number
      }
    }

    return formatter.format(number);
  }
}
