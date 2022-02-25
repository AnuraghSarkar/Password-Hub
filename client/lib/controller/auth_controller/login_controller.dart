import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPasswordVisibile = false.obs;
  var buttonText = "Sign In".obs;
  var isButtonEnabled = true.obs;

  togglePassword() {
    if (isPasswordVisibile.value) {
      isPasswordVisibile(false);
    } else {
      isPasswordVisibile(true);
    }
  }

  toggleButton(bool value) {
    isButtonEnabled(value);
  }

  setButtonText(text) {
    buttonText(text);
  }
  sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then(((value) => {
          if (!value)
            {AwesomeNotifications().requestPermissionToSendNotifications()}
        }));
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 4,
      channelKey: 'password_notification',
      title: 'Just In',
      body: 'You just logged in to Password Hub',
    ));
  }
}
