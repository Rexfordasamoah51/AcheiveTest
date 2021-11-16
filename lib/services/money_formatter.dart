class MoneyFormat {
  String? price;

  static String moneyFormat(String price) {
    var value = price;
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return value;
  }
}

String truncate(String string, int length, [String? omission]) {
  if (string.length <= length) {
    return string;
  }
  omission ??= '';
  return string.substring(0, length - omission.length) + omission;
}
