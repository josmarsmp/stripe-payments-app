part of 'helpers.dart';

void showCustomDialog(
    {required BuildContext context, required Icon icon, required String title, required String message, Widget? buttonIcon, required VoidCallback onButtonPressed}) {
  showDialog(
      context: context,
      barrierColor: Colors.black38,
      builder: (_) => ElasticIn(
            child: CustomDialogWidget(
                title: title,
                message: message,
                icon: icon,
                buttonIcon: buttonIcon,
                onButtonPressed: onButtonPressed,
            )
          ));
}
