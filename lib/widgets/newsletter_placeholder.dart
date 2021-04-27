import 'package:flutter/material.dart';

class NewsletterPlaceholder extends StatefulWidget {
  const NewsletterPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  _NewsletterPlaceholderState createState() => _NewsletterPlaceholderState();
}

class _NewsletterPlaceholderState extends State<NewsletterPlaceholder> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(size.height / 32),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffDB4437)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Subscribe to our newsletter',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: size.height / 32,
                      color: Colors.black,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Subscribe to our newsletter to get the latest updates about our events and hacks right in your inbox.',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: size.height / 54,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070)),
              ),
            ),
            Form(
              key: _formKey,
              child: TextFormField(
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
                style: TextStyle(fontSize: 16, color: Color(0xff707070)),
                decoration: InputDecoration(
                    hintText: 'email address',
                    hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Color(0xff707070),
                          fontWeight: FontWeight.bold,
                          fontSize: size.height / 48,
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
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState.validate();
                    },
                    child: Text('Subscribe'),
                    style: Theme.of(context).elevatedButtonTheme.style.copyWith(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
