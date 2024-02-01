import 'dart:async';

class ConnectionServiceModel {
  // connectivity controller
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertDialog = false;
}
