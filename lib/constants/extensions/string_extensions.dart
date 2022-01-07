extension StringExtension on String {
  String capitalizer() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
