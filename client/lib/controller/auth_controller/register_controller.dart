import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var buttonText = "Sign Up".obs;
  var isButtonEnabled = true.obs;

  //togglling password visible
  togglePassword() {
    if (isPasswordVisible.value) {
      isPasswordVisible(false);
    } else {
      isPasswordVisible(true);
    }
  }

  //toggling confirmPassword
  toggleConfirmPassword() {
    if (isConfirmPasswordVisible.value) {
      isConfirmPasswordVisible(false);
    } else {
      isConfirmPasswordVisible(true);
    }
  }

  setButtonText(text) {
    buttonText(text);
  }

  toggleButton(bool value) {
    isButtonEnabled(value);
  }

  sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then(((value) => {
          if (!value)
            {AwesomeNotifications().requestPermissionToSendNotifications()}
        }));
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 5,
      channelKey: 'password_notification',
      title: 'Just In',
      body: 'You just registered your account',
    ));
  }
}
