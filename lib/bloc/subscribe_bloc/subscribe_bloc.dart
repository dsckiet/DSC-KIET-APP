import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dsckiet/services/api_key.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'subscribe_event.dart';
part 'subscribe_state.dart';

class SubscribeBloc extends Bloc<SubscribeEvent, SubscribeState> {
  SubscribeBloc() : super(SubscribeInitial());

  @override
  Stream<SubscribeState> mapEventToState(
    SubscribeEvent event,
  ) async* {
    if (event is Subscirbing) {
      yield SubscribingInProcess();
      try {
        Uri url = Uri.parse('https://api.buttondown.email/v1/subscribers');
        final res = await post(url, body: {
          'email': event.email,
        }, headers: {
          'Authorization': 'Token $apiKey'
        });
        if (res.statusCode == 201)
          yield Subscribed();
        else {
          String message;
          if (res.body.contains("subscribed"))
            message = "This email is already subscribed";
          else if (res.body.contains("does not exist") ||
              res.body.contains("invalid"))
            message = "This email does not exist";
          else
            message = "Something went Wrong!, please try again";
          yield SubscribeFailed(message);
        }
      } catch (e) {
        yield SubscribeFailed('Something went Wrong!, please try again');
      }
    }
  }
}

Map errorsMap = {
  'Sorry, our system has previously detected this email to be invalid or spammy.':
      'Please enter a valid email',
  'Google is telling Buttondown that this address does not exist': '',
  'There is no MX record associated with gmail.comgh':
      'Please enter a valid email',
};
