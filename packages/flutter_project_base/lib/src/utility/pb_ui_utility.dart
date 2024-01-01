part of flutter_project_base;

class PBUIUtility {
  /// ------- SnackBar -------
  void showSnackBar(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 1)}) {
    ///
    if (message.isEmpty) {
      return;
    }

    ///
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration,
        ),
      );
  }
}
