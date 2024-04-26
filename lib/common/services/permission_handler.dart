import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermission() async {
  final status = await Permission.notification.request();
  if (status.isGranted) {
    // Permission granted, proceed with notification setup
    print('Notification permission granted');
  } else if (status.isDenied) {
    // Permission denied, explain to user and potentially open app settings
    print('Notification permission denied');
    await openAppSettings();
  } else if (status.isPermanentlyDenied) {
    // Permission permanently denied, explain to user and guide them to app settings
    print('Notification permission permanently denied');
    await openAppSettings();
  } else {
    // Should never happen, handle other states if necessary
    print('Notification permission request unknown status: $status');
  }
}
