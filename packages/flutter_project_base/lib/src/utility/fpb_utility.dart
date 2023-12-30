part of flutter_project_base;

String formate1Decimal(double value) {
  final formatter = NumberFormat('###.#');
  return formatter.format(value);
}

String formate2Decimal(double value) {
  final formatter = NumberFormat('###.##');
  return formatter.format(value);
}
