import 'package:dsckiet/bloc/subscribe_bloc/subscribe_bloc.dart';
import 'package:dsckiet/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsletterPlaceholder extends StatefulWidget {
  const NewsletterPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  _NewsletterPlaceholderState createState() => _NewsletterPlaceholderState();
}

class _NewsletterPlaceholderState extends State<NewsletterPlaceholder> {
  final subscribeBloc = SubscribeBloc();

  final _formKey = GlobalKey<FormState>();
  bool _error = false;

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.all(0),
      color: Colors.transparent,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(size.height / 32),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffDB4437)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              color: red,
              spreadRadius: 1,
            )
          ],
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Subscribe to our newsletter',
                style: subHeading(context).copyWith(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Subscribe to our newsletter to get the latest updates about our events and hacks right in your inbox.',
                style: body1(context),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 1),
                      color: _error ? Colors.transparent : Colors.black,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.emailAddress,
                  scrollPadding: EdgeInsets.only(bottom: 120),
                  validator: (value) {
                    if (RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$",
                            caseSensitive: false)
                        .hasMatch(value))
                      return null;
                    else
                      return 'please enter a valid email';
                  },
                  style: body1(context).copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: 'email address',
                      hintStyle: body1(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        gapPadding: 0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16)),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                buildSubscribeButton(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton buildSubscribeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _error = false;
          subscribeBloc.add(Subscirbing(controller.text));
          setState(() {});
        } else {
          _error = true;
          setState(() {});
        }
      },
      child: BlocListener<SubscribeBloc, SubscribeState>(
        bloc: subscribeBloc,
        listener: (context, state) {
          if (state is SubscribeFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: red,
                elevation: 8,
              ),
            );
          }
          if (state is Subscribed) {
            controller.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("You are now subscribed to DSC KIET!"),
                backgroundColor: blue,
                elevation: 8,
              ),
            );
          }
        },
        child: BlocBuilder<SubscribeBloc, SubscribeState>(
          bloc: subscribeBloc,
          builder: (context, state) {
            if (state is SubscribeInitial)
              return Text(
                'Subscribe',
                style: body1(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            else if (state is SubscribingInProcess)
              return Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: Colors.white,
                ),
              );
            else
              return Text(
                'Subscribe',
                style: body1(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
          },
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 28,
        ),
        minimumSize: Size(150, 40),
      ),
    );
  }
}
