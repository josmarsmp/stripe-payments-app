part of 'helpers.dart';

double getHeightByPercent(BuildContext context, double percent) {
  final double height = MediaQuery.of(context).size.height;
  final double decimalPercent = percent / 100;

  return height * decimalPercent;
}


double getWidthByPercent(BuildContext context, double percent) {
  final double width = MediaQuery.of(context).size.width;
  final double decimalPercent = percent / 100;

  return width * decimalPercent;
}
