import 'package:flutter/material.dart';

class NewsletterPlaceholder extends StatelessWidget {
  const NewsletterPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PhysicalModel(
      color: Colors.transparent,
      // shadowColor: Colors.transparent,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(size.height / 27.5),
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'email address',
                  hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.bold,
                        fontSize: size.height / 48,
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
                padding: EdgeInsets.symmetric(horizontal: size.width / 48),
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
