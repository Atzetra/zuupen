extension StringExtension on String {
  String capitalizer() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
