part of 'subscribe_bloc.dart';

@immutable
abstract class SubscribeState {}

class SubscribeInitial extends SubscribeState {}

class SubscribingInProcess extends SubscribeState {}

class Subscribed extends SubscribeState {}

class SubscribeFailed extends SubscribeState {
  final String error;

  SubscribeFailed(this.error);
}
