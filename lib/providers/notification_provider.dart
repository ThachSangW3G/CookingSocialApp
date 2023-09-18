import 'package:cooking_social_app/repository/notification_repository.dart';
import 'package:flutter/cupertino.dart';

import '../models/notification_model.dart';

class NotificationProvider extends ChangeNotifier{
  late NotificationRepository _notificationRepository;

  List<Map<String, dynamic>> _notifications = [];

  List<Map<String, dynamic>> get notifications => _notifications;

  NotificationProvider(){
    _notificationRepository = NotificationRepositoryImpl();


    init();
  }

  Future<void> markAllRead() async {
    print('Sang');
    for(var notification in notifications){
      final noti = notification['notification'] as NotificationModel;
      noti.read = true;


      await updateNotification(noti);

    }
  }

  Future<void> init() async {

    _notifications = await _notificationRepository.getListNotification();
    notifyListeners();
  }

  Future<void> updateNotification(NotificationModel notificationModel) async {
    await _notificationRepository.updateNotification(notificationModel);

    init();
    notifyListeners();
  }

  Future<void> addNotification(NotificationModel notificationModel) async {
    await _notificationRepository.addNotification(notificationModel);
    notifyListeners();
  }
}