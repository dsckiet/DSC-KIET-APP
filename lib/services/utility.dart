import 'package:dsckiet/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  showAlertDialog(RemoteMessage message, BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message.notification.title,
              style: subHeading(context).copyWith(fontSize: 24),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (message.notification.android.imageUrl != null)
                  Center(
                    child: Image.network(message.notification.android.imageUrl),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Wrap(
                  children: [
                    Text(
                      message.notification.body,
                      style: body1(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                if (message.data['link'] != null)
                  ElevatedButton(
                    onPressed: () {
                      launch("https://${message.data['link']}");
                    },
                    child: Text('Contest Link'),
                  ),
              ],
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
          );
        });
  }
}
