part of flutter_project_base;

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
