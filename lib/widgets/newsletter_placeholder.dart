import 'package:flutter/material.dart';

class NewsletterPlaceholder extends StatelessWidget {
  const NewsletterPlaceholder({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 4,
      child: Container(
        width: size.width / 3,
        height: size.height / 2.7,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffDB4437)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Subscribe to our newsletter',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 24,
                      color: Colors.black,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Subscribe to our newsletter to get the latest updates about our events and hacks right in your inbox.',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070)),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'email address',
                  hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    gapPadding: 0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 16)),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Subscribe'),
              ),
              style: Theme.of(context).elevatedButtonTheme.style.copyWith(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
