import 'package:cooking_social_app/components/notification_item.dart';
import 'package:cooking_social_app/models/notification_model.dart';
import 'package:cooking_social_app/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/line_row.dart';
import '../../constants/app_color.dart';
import '../../models/recipe.dart';
import '../../routes/app_routes.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final NotificationProvider notificationProvider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Recoleta'),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            )),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                notificationProvider.deleteNotification();

              },
              child: const Text(
                'Clear',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.orangeCrusta,
                    fontSize: 18,
                    fontFamily: 'CeraPro'),
              ),
            ),
          )
        ],
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(16.0), child: LineRow()),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: notificationProvider.getListNotification(),
        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else {
            final notifications = snapshot.data;

            if (notifications!.isEmpty){
              return const Center(
                child: Text(
                  'There are no notification!',
                  style: TextStyle(
                    fontFamily: 'CeraPro',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }

            return ListView.builder(
                itemCount: notifications!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final dataNotification = notifications[index];
                  final notificationUpdate = dataNotification['notification'] as NotificationModel;
                  return GestureDetector(
                    onTap: (){

                      notificationUpdate.read = true;

                      notificationProvider.updateNotification(notificationUpdate);

                      if(notificationUpdate.type == 'liked'){
                        Navigator.of(context).pushNamed(
                            RouteGenerator.recipedetailScreen,
                            arguments: notificationUpdate.idRecipe);
                      }else if(notificationUpdate.type == 'newFollower') {
                        Navigator.of(context).pushNamed(
                            RouteGenerator.accountpersonScreen,
                            arguments: notificationUpdate.idUserGuest);
                      }
                      else if(notificationUpdate.type == 'newReview'){
                        Navigator.of(context).pushNamed(
                            RouteGenerator.reviewScreen,
                            arguments: dataNotification['recipe'] as Recipe);
                      }

                    },
                    child: NotificationItem(
                      notification: dataNotification['notification'],
                      userGuest: dataNotification['userGuest'],
                      userOwner: dataNotification['userOwner'],
                      recipe: notificationUpdate.idRecipe != "" ? dataNotification['recipe'] : null,
                    ),
                  );

                }

            );
          }
         // print(notificationProvider.notifications);


        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.appYellow),
          onPressed: () {
            notificationProvider.markAllRead();
            print('Sang');
          },
          child: const Center(
            child: Text(
              'Mark all as Read',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
