import 'package:dsckiet/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventNotificationScreen extends StatelessWidget {
  final RemoteMessage message;

  const EventNotificationScreen({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.notification.title,
                style: subHeading(context),
              ),
              largePadding,
              Image.network(
                message.notification.android.imageUrl,
              ),
              smallPadding,
              Text(
                message.notification.body,
                style: body2(context).copyWith(
                  height: 1.33,
                  wordSpacing: 1.3,
                ),
              ),
              smallPadding,
              if (message.data['time'] != null)
                Text(
                  message.data['time'],
                  style: body1(context).copyWith(fontWeight: FontWeight.bold),
                ),
              Spacer(),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    launch(
                      message.data['link'],
                    );
                  },
                  child: Text('Launch'),
                ),
              ),
              smallPadding,
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Skip >>'),
                ),
              ),
              smallPadding,
            ],
          ),
        ),
      ),
    );
  }
}
