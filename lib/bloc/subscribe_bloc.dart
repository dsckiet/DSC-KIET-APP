import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
      Map<String, dynamic> data = {"email": "ayushc45xxx@gmail.com"};
      final body = jsonEncode(data);
      try {
        final res = await Dio().post(
          "https://buttondown.email/api/emails/embed-subscribe/dsckiet",
          data: {"email": "ayushc45xxx@gmail.com"},
          options: Options(
            headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            },
            followRedirects: false,
            method: 'POST',
            validateStatus: (status) {
              return status < 500;
            },
          ),
        );
        print(res.statusCode);
        print(res.data);
        print(res.headers);
        if (res.statusCode == 200)
          yield Subscribed();
        else
          yield SubscribeFailed(res.data.toString());
      } on DioError catch (error) {
        print(error.response.data);
        yield SubscribeFailed(error.message.toString());
      }
    }
  }
}
