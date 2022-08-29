import 'package:flutter/services.dart';

const kUsersCollection = 'user-data';

const kAnimationDuration = Duration(milliseconds: 200);
const kUnknownError = 'Unknown error';

const kCountryCode = '91';

const kRupeeSymbol = '\u20B9';

final currencyInputFormatter = FilteringTextInputFormatter.allow(
  RegExp(r'^\d+\.?\d{0,2}'),
);
