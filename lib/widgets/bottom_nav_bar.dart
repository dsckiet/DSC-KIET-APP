import 'package:dsc_kiet_mobile_app/clipper/myclipper.dart';
import 'package:dsc_kiet_mobile_app/provider/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supercharged/supercharged.dart';

enum AnimProps {
  homeButtonColor,
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: PhysicalModel(
        elevation: 4,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          // height: size.height / 16,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: PhysicalModel(
                        elevation: 8,
                        color: Colors.transparent,
                        child: ClipPath(
                          clipper: MyClipper1(),
                          child: Container(
                            height: size.height / 14,
                            color: Color(0xff4285f4),
                            child: ClipPath(
                              clipper: MyClipper(),
                              child: Container(
                                height: size.height / 16,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 32.0),
                                      child: InkWell(
                                        onTap: () {
                                          context
                                              .read(selectedScreenProvider)
                                              .changeScreen(1);
                                          _selected = 1;
                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AnimatedContainer(
                                              duration: 450.milliseconds,
                                              width: _selected == 1
                                                  ? size.width / 8
                                                  : size.width / 10,
                                              child: AnimatedOpacity(
                                                duration: _selected == 1
                                                    ? 100.milliseconds
                                                    : 1.milliseconds,
                                                opacity: _selected == 1 ? 1 : 0,
                                                child: Text(
                                                  'Team',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff4285f4),
                                                      ),
                                                ),
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/team.svg',
                                              height: 28,
                                              color: _selected == 1
                                                  ? Color(0xff4285f4)
                                                  : Color(0xff707070),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 32.0),
                                      child: InkWell(
                                        onTap: () {
                                          context
                                              .read(selectedScreenProvider)
                                              .changeScreen(2);
                                          _selected = 2;
                                          setState(() {});
                                        },
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/support.svg',
                                                color: _selected == 2
                                                    ? Color(0xff4285f4)
                                                    : Color(0xff707070),
                                                height: 28,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10)),
                                              AnimatedContainer(
                                                duration: 450.milliseconds,
                                                width: _selected == 2
                                                    ? size.width / 5.8
                                                    : size.width / 10,
                                                child: AnimatedOpacity(
                                                  duration: _selected == 2
                                                      ? 100.milliseconds
                                                      : 1.milliseconds,
                                                  opacity:
                                                      _selected == 2 ? 1 : 0,
                                                  child: Text(
                                                    'Support',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2
                                                        .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: _selected == 2
                                                              ? Color(
                                                                  0xff4285f4)
                                                              : Color(
                                                                  0xff707070),
                                                        ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height / 24),
                child: PhysicalModel(
                  elevation: 4,
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  child: AnimatedContainer(
                    duration: 450.milliseconds,
                    decoration: BoxDecoration(
                      color: _selected == 0
                          ? Color(0xff4285f4)
                          : Color(0xfff1f1f1),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(3),
                    child: InkWell(
                      onTap: () {
                        context.read(selectedScreenProvider).changeScreen(0);
                        _selected = 0;
                        setState(() {});
                      },
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
