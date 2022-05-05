import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/tournament_list_model/tournament_list_model.dart.dart';
import '../../repositories/tournament_list_repository/tournament_list_repository.dart';

export '../../models/tournament_list_model/tournament_list_model.dart.dart';
export '../../repositories/tournament_list_repository/tournament_list_repository.dart';

class TournamentListBloc extends Cubit<TournamentListState> {
  final TournamentListRepository repository;
  TournamentListBloc(
    TournamentListState initialState,
    this.repository,
  ) : super(initialState);

  Future getTournamentListData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      final TournamentListModel? data = await repository.getTournamentListData(
        queryparams: queryparams,
      );

      if (data == null) {
        emit(ErrorTournamentListState());
      } else {
        emit(
          SuccessTournamentListState(
            data: data,
          ),
        );
      }
    } on Exception catch (_) {
      emit(ErrorTournamentListState());
    }
  }
}

final tournamentListBloc = TournamentListBloc(
  LoadingTournamentListState(),
  TournamentListRepository(),
);

abstract class TournamentListState {}

class ErrorTournamentListState extends TournamentListState {
  final String? error;

  ErrorTournamentListState({
    this.error = "An error occurred, please try again later.",
  });
}

class LoadingTournamentListState extends TournamentListState {}

class SuccessTournamentListState extends TournamentListState {
  final TournamentListModel? data;

  SuccessTournamentListState({
    this.data,
  });
}
