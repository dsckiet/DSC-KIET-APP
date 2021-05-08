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
