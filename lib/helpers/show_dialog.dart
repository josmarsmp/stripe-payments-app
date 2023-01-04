part of 'helpers.dart';

showCustomDialog(
    {required BuildContext context, required Icon icon, required String title, required String message}) {
  showDialog(
      context: context,
      barrierColor: Colors.black38,
      builder: (_) => ElasticIn(
            child: CustomDialogWidget(
                title: title,
                message: message,
                icon: icon,
            )
          ));
}
