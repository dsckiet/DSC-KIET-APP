part of 'teamdata_bloc.dart';

@immutable
abstract class TeamdataState {}

class TeamdataInitial extends TeamdataState {}

class TeamdataLoading extends TeamdataState {}

class TeamdataLoaded extends TeamdataState {
  final List<Map<String, String>> data;

  TeamdataLoaded(this.data);
}

class TeamdataFailure extends TeamdataState {
  final String error;

  TeamdataFailure(this.error);
}
