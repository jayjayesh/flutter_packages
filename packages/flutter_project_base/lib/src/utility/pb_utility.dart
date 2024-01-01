part of flutter_project_base;

// ------- UI -------
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}

/// ------- FORMATE -------
String formateUpto1Decimal(double value) {
  final formatter = NumberFormat('###.#');
  return formatter.format(value);
}

String formateUpto2Decimal(double value) {
  final formatter = NumberFormat('###.##');
  return formatter.format(value);
}
