import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dpboss/Screen/flutter_toast_message/toast_messge.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BackTocloseApp {
  DateTime? _lastBackPressed;
  late var controller = WebViewController();
  Future<bool> myInterceptor(
      bool stopDefaultButtonEvent, RouteInfo info, controoller) async {
    controller = controoller;
    DateTime now = DateTime.now();
    if (await controller.canGoBack()) {
      controller.goBack();
      return true;
    } else if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > Duration(seconds: 2)) {
      _lastBackPressed = now;
      //ScaffoldMessenger.of(context).showSnackBar(
      ShowToast(msg: "Press back again to exit");
      // SnackBar(
      //   content: Text("Press back again to exit"),
      //   duration: Duration(seconds: 2),
      // ),
      // );
      return true; // Do not exit the app
    } else if (_lastBackPressed != null ||
        now.difference(_lastBackPressed!) < Duration(seconds: 2)) {
      return false;
    } else
      //SystemNavigator.pop();
      return true; // Exit the app
  }
}
