import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsckiet/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventNotificationScreen extends StatelessWidget {
  final Map<String, String> data;

  const EventNotificationScreen({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'],
                    style: subHeading(context),
                  ),
                  largePadding,
                  CachedNetworkImage(
                    imageUrl: data['image_url'],
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  smallPadding,
                  Text(
                    data['body'],
                    style: body2(context).copyWith(
                      height: 1.33,
                      wordSpacing: 1.3,
                    ),
                  ),
                  smallPadding,
                  if (data['time'] != null)
                    Text(
                      data['time'],
                      style:
                          body1(context).copyWith(fontWeight: FontWeight.bold),
                    ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        launch(
                          "https://${data['link']}",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
