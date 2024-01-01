part of flutter_project_base;

void printf(dynamic value) {
  if (!kReleaseMode) dev.log(value.toString());
}

class PBUtility {
  ///
  static String formateUpto1Decimal(double value) {
    final formatter = NumberFormat('###.#');
    return formatter.format(value);
  }

  static String formateUpto2Decimal(double value) {
    final formatter = NumberFormat('###.##');
    return formatter.format(value);
  }

  static formatDateWithInputOutputFormate(
    String dateString,
    String inputDateFormat,
    String outputDateFormat,
  ) {
    // String dateString = '01/03/2023';

    DateTime dateTime = DateFormat(inputDateFormat).parse(dateString);
    String formattedDate = DateFormat(outputDateFormat).format(dateTime);

    // Output: 2023-03-01
    return formattedDate;
  }

  static bool isSameDayOrAfter(DateTime mainBaseDate, DateTime secondDate) {
    // Compare year, month, and day of the two dates
    if (mainBaseDate.year == secondDate.year &&
        mainBaseDate.month == secondDate.month &&
        mainBaseDate.day == secondDate.day) {
      return true; // The dates are on the same day
    } else if (secondDate.isAfter(mainBaseDate)) {
      return true; // The second date is after the first date
    }
    return false; // The second date is before the first date
  }

  ///
  void openUrl(String url) {
    if (url.isEmpty) {
      return;
    }

    //
    if (url.contains('.pdf')) {
      String googleDocsUrl = "http://docs.google.com/viewer?embedded=true&url=";
      url = googleDocsUrl + url;
    }

    //
    Uri finalUrl = Uri.parse(url);
    _launch(finalUrl);
  }

  Future<void> _launch(Uri url) async {
    debugPrint(url.toString());
    await launchUrl(url);
    // await canLaunchUrl(url)
    //     ? await launchUrl(url)
    //     : Utility.snackBar('could open this link', Get.context!);
  }
}
