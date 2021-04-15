import 'package:dsc_kiet_mobile_app/provider/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 32.0, vertical: size.height / 5.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  context.read(selectedScreenProvider).changeScreen(0);
                  Navigator.pop(context);
                },
                child: Text(
                  'Home',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {
                  context.read(selectedScreenProvider).changeScreen(1);
                  Navigator.pop(context);
                },
                child: Text(
                  'About',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {
                  context.read(selectedScreenProvider).changeScreen(1);
                  Navigator.pop(context);
                },
                child: Text(
                  'Team',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {
                  context.read(selectedScreenProvider).changeScreen(2);
                  Navigator.pop(context);
                },
                child: Text(
                  'Guidelines',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {
                  context.read(selectedScreenProvider).changeScreen(3);
                  Navigator.pop(context);
                },
                child: Text(
                  'FAQs',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {
                  context.read(selectedScreenProvider).changeScreen(1);
                  Navigator.pop(context);
                },
                child: Text(
                  'Contact',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            Divider(
              color: Color(0xff707070),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 18,
                    ),
                    Text(
                      'Developer Student Clubs',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 16,
                          ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'KIET Group of Institutions',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
