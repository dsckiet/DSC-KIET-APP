import 'dart:async';

import 'package:bloc/bloc.dart';
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
      final url = Uri.parse(
          "https://buttondown.email/api/emails/embed-subscribe/dsckiet");
      try {
        final res = await post(
          url,
          body: {"email": event.email},
        );
        print(res.body);
        if (res.statusCode == 200)
          yield Subscribed();
        else if (res.statusCode == 302) {
          final redirectUrl = Uri(
            scheme: 'https',
            host: 'buttondown.email',
            path: res.headers['location'],
          );
          final redirectResponse = await get(redirectUrl);
          print(redirectResponse.body);
          if (redirectResponse.statusCode == 200)
            yield Subscribed();
          else
            yield SubscribeFailed('Something went wrong! Plese try again.');
        } else
          yield SubscribeFailed('Something went wrong! Plese try again.');
      } catch (error) {
        print(error);
        yield SubscribeFailed('Something went wrong! Plese try again.');
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
