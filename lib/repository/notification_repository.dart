import 'package:cooking_social_app/models/notification_model.dart';
import 'package:cooking_social_app/remote/notification_firestore_service.dart';

import '../models/user_model.dart';
import '../remote/user_firestore_service.dart';

abstract class NotificationRepository{
  Future<List<Map<String, dynamic>>> getListNotification();
  Future<void> updateNotification(NotificationModel notificationModel);
  Future<void> addNotification(NotificationModel notificationModel);
}

class NotificationRepositoryImpl implements NotificationRepository{

  NotificationFirestoreService _notificationFirestoreService;
  UserFirestoreService _userFirestoreService;

  NotificationRepositoryImpl({NotificationFirestoreService? notificationFirestoreService, UserFirestoreService? userFirestoreService}) : _notificationFirestoreService = notificationFirestoreService ?? NotificationFirestoreService()
    , _userFirestoreService = userFirestoreService ?? UserFirestoreService();


  @override
  Future<List<Map<String, dynamic>>> getListNotification() async {

    List<Map<String, dynamic>> data = [];

    List<NotificationModel> notifications = await _notificationFirestoreService.getListNotification();


    for(var notification in notifications){
      UserModel userOwner = await
      _userFirestoreService.getUser(notification.idUserOwner) ;

      UserModel userGuest = await _userFirestoreService.getUser(notification.idUserGuest);

      Map<String, dynamic> map = {
        'notification': notification,
        'userOwner': userOwner,
        'userGuest': userGuest
      };

      data.add(map);

    }

    return Future.value(data);
  }

  @override
  Future<void> updateNotification(NotificationModel notificationModel) {
    return _notificationFirestoreService.updateNotification(notificationModel);
  }

  @override
  Future<void> addNotification(NotificationModel notificationModel) {
    return _notificationFirestoreService.addNotification(notificationModel);
  }

}