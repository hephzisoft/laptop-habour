import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common/services/notification_service.dart';
import 'common/services/permission_handler.dart';
import 'common/services/storage.dart';
import 'firebase_options.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await requestNotificationPermission();
    NotificationService().initNotification();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService = await StorageService().init();
  }
}
