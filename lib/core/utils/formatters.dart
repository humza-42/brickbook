import 'package:intl/intl.dart';

class Formatters {
  Formatters._();

  static final _pkr = NumberFormat('#,##0.00', 'en_PK');
  static final _pkrInt = NumberFormat('#,##0', 'en_PK');
  static final _date = DateFormat('d MMM yyyy');
  static final _dateShort = DateFormat('d MMM');
  static final _time = DateFormat('h:mm a');

  static String pkr(double amount) => 'Rs. ${_pkr.format(amount)}';
  static String pkrInt(double amount) => 'Rs. ${_pkrInt.format(amount)}';
  
  static String pkrCompact(double amount) {
    if (amount >= 1000000) return 'Rs. ${(amount / 1000000).toStringAsFixed(1)}M';
    if (amount >= 1000) return 'Rs. ${(amount / 1000).toStringAsFixed(0)}K';
    return pkrInt(amount);
  }

  static String date(DateTime dt) => _date.format(dt);
  static String dateShort(DateTime dt) => _dateShort.format(dt);
  static String time(DateTime dt) => _time.format(dt);

  static String relative(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    if (diff < 7) return '$diff days ago';
    if (diff < 30) return '${(diff / 7).floor()} weeks ago';
    return date(dt);
  }

  static String budgetPercent(double spent, double total) {
    if (total == 0) return '0%';
    return '${((spent / total) * 100).toStringAsFixed(1)}%';
  }
}
