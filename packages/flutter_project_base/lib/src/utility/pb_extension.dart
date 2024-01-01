part of flutter_project_base;

// ------- UI -------

extension OnColumn on Column {
  Widget padding(EdgeInsets edgeInsets) {
    return Padding(padding: edgeInsets, child: this);
  }
}

extension OnRow on Row {
  Widget padding(EdgeInsets edgeInsets) {
    return Padding(padding: edgeInsets, child: this);
  }
}

// ------- Logic -------

extension OrDefault<T> on T? {
  T get orDefault {
    final value = this;
    if (value == null) {
      return {
        int: 0,
        double: 0.0,
        num: 0.0,
        String: '',
        Map: {},
      }[T] as T;
    } else {
      return value;
    }
  }
}

/// Define an extension:
extension DoubleExtention on double {
  // how much digit you want after decimal point
  double toPrecisionExtensionMethod(int n) => double.parse(toStringAsFixed(n));
}

/// Define an extension:
extension StringExtention on String {
  ///
  String firstChars(int n) {
    return substring(0, length < n ? length : n);
  }

  String lastChars(int n) => substring(length - n);

  ///
  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  ///
  double toDouble() {
    return double.tryParse(this) ?? 0.0;
  }

  ///
  num toNumber() {
    return num.tryParse(this) ?? 0.0;
  }
}
