part of 'subscribe_bloc.dart';

@immutable
abstract class SubscribeEvent {}

class Subscirbing extends SubscribeEvent {
  final String email;

  Subscirbing(this.email);
}
