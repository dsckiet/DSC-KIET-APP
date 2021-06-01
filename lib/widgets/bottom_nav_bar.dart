import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dsckiet/provider/screen_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supercharged/supercharged.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selected = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CurvedNavigationBar(
        backgroundColor: Colors.grey.withOpacity(0.2),
        color: Colors.white,
        height: 56,
        index: 1,
        animationDuration: 300.milliseconds,
        onTap: (value) {
          context.read(selectedScreenProvider).changeScreen(value);
          _selected = value;
          setState(() {});
        },
        items: [
          AnimatedContainer(
            duration: 250.milliseconds,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: _selected == 0 ? Color(0xff4285f4) : Colors.white,
                shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                margin: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/icons/team.svg',
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: 250.milliseconds,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: _selected == 1 ? Color(0xff4285f4) : Colors.white,
                shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
                margin: EdgeInsets.all(8),
              ),
            ),
          ),
          AnimatedContainer(
            duration: 250.milliseconds,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: _selected == 2 ? Color(0xff4285f4) : Colors.white,
                shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                margin: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/icons/contact.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
