import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 32.0, vertical: size.height / 5.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Home',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'About',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Team',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Guidelines',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'FAQs',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, color: Color(0xff707070)),
                )),
            TextButton(
                onPressed: () {},
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
