import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/notification_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class NotificationDataService{
  Future<List<NotificationModel>> getListNotification();
  Future<void> updateNotification(NotificationModel notificationModel);
  Future<void> addNotification(NotificationModel notificationModel);
  Future<void> deleteNotification();
}

class NotificationFirestoreService implements NotificationDataService{

  CollectionReference notifications = FirebaseFirestore.instance.collection('notifications');

  @override
  Future<List<NotificationModel>> getListNotification() async {
    List<NotificationModel> notificationList = [];
    await notifications
        .where('idUserOwner', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        notificationList.add(NotificationModel.fromJson(doc.data() as Map<String, dynamic>));
        //print(notificationList.length);
      });
    });

    //print(notificationList.length);

    return Future.value(notificationList);
  }

  @override
  Future<void> updateNotification(NotificationModel notificationModel) {
    return notifications
        .doc(notificationModel.id)
        .update(notificationModel.toJson())
        .then((value) => print('notification updated'));
  }

  @override
  Future<void> addNotification(NotificationModel notificationModel) {
    return notifications.doc(notificationModel.id).set(notificationModel.toJson()).then((value) => print('notification add'));
  }

  @override
  Future<void> deleteNotification() async {
    List<NotificationModel> listNotification = await getListNotification();

    for(var notification in listNotification){
      notifications.doc(notification.id).delete().then((value) => print('notification likecookbook'));
    }

  }

}