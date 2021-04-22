import 'package:dsc_kiet_mobile_app/clipper/myclipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supercharged/supercharged.dart';

class BottomNavBar extends StatefulWidget {
  final PageController controller;

  const BottomNavBar({Key key, this.controller}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  int _selected = 0;
  AnimationController controller1, controller2;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      duration: 300.milliseconds,
      vsync: this,
    );
    controller2 = AnimationController(
      duration: 300.milliseconds,
      vsync: this,
    );
  }

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
                                      padding:
                                          EdgeInsets.only(left: size.width / 5),
                                      child: InkWell(
                                        onTap: () {
                                          widget.controller.animateToPage(0,
                                              duration: 300.milliseconds,
                                              curve: Curves.easeIn);
                                          _selected = 1;
                                          controller1.forward();
                                          controller2.reverse();
                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AnimatedBuilder(
                                              animation: controller1,
                                              builder: (context, child) {
                                                return SvgPicture.asset(
                                                  'assets/icons/team.svg',
                                                  height: Tween<double>(
                                                          begin: 28, end: 36)
                                                      .animatedBy(controller1)
                                                      .value,
                                                  color: _selected == 1
                                                      ? Color(0xff4285f4)
                                                      : Color(0xff707070),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: size.width / 6),
                                      child: InkWell(
                                        onTap: () {
                                          widget.controller.animateToPage(2,
                                              duration: 300.milliseconds,
                                              curve: Curves.easeIn);
                                          _selected = 2;
                                          controller2.forward();
                                          controller1.reverse();
                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AnimatedBuilder(
                                              animation: controller2,
                                              builder: (context, child) =>
                                                  SvgPicture.asset(
                                                'assets/icons/support.svg',
                                                color: _selected == 2
                                                    ? Color(0xff4285f4)
                                                    : Color(0xff707070),
                                                height: Tween<double>(
                                                        begin: 28, end: 36)
                                                    .animatedBy(controller2)
                                                    .value,
                                              ),
                                            ),
                                          ],
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
                        widget.controller.animateToPage(1,
                            duration: 300.milliseconds, curve: Curves.easeIn);
                        _selected = 0;
                        controller1.reverse();
                        controller2.reverse();
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
