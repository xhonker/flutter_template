import 'package:oktoast/oktoast.dart';

class Toast {
  static void show(String msg, {int duration = 2000, ToastPosition position = ToastPosition.bottom}) {
    if (msg.isEmpty) return;
    showToast(
      msg,
      duration: Duration(milliseconds: duration),
      dismissOtherToast: true,
      position: position,
    );
  }

  static void cancelToast() => dismissAllToast();
}
