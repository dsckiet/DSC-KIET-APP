import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'teamdata_event.dart';
part 'teamdata_state.dart';

class TeamdataBloc extends Bloc<TeamdataEvent, TeamdataState> {
  TeamdataBloc() : super(TeamdataInitial());

  @override
  Stream<TeamdataState> mapEventToState(
    TeamdataEvent event,
  ) async* {
    if (event is FetchTeamData) {
      yield TeamdataLoading();
    }
  }
}
