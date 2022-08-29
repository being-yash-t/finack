import 'package:finack/src/core/constants/firebase.dart';
import 'package:intl/intl.dart';

extension NumExtension on num {
  String get currency => NumberFormat.currency(
        locale: 'hi',
        decimalDigits: 2,
        symbol: kRupeeSymbol,
      ).format(this);
}
