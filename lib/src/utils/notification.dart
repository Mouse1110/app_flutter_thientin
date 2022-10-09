import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationService {
  NotificationService();

  final _notificationService = FlutterLocalNotificationsPlugin();
  final PublishSubject<String?> onNotificationClick = PublishSubject();
  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();

    const InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: initializationSettingsDarwin);
    await _notificationService.initialize(settings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    print(notificationResponse.payload);
    onNotificationClick.add(notificationResponse.payload);
  }

  Future<NotificationDetails> _notificationsDetail() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'channelDescription',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    const DarwinNotificationDetails iosDetail = DarwinNotificationDetails();
    return const NotificationDetails(android: androidDetails, iOS: iosDetail);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final _detail = await _notificationsDetail();
    await _notificationService.show(id, title, body, _detail, payload: payload);
  }
}
