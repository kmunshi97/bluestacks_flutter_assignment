import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../logic/blocs/tournament_list_bloc/tournament_list_bloc.dart';
import 'tournament_list_tile_widget.dart';

class TournamentListWidget extends StatefulWidget {
  final ScrollController scrollController;

  const TournamentListWidget({
    Key? key,
    //
    required this.scrollController,
  }) : super(key: key);

  @override
  State<TournamentListWidget> createState() => _TournamentListWidgetState();
}

class _TournamentListWidgetState extends State<TournamentListWidget> {
  final List list = [];
  bool isLastBatch = false;

  //
  String cursor = "";

  @override
  void initState() {
    widget.scrollController.addListener(_onScroll);

    tournamentListBloc.getTournamentListData(
      queryparams: {
        "limit": 10,
        "status": "all",
        "cursor": cursor,
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TournamentListBloc>(
      create: (BuildContext context) => tournamentListBloc,
      child: BlocBuilder<TournamentListBloc, TournamentListState>(
        builder: (BuildContext context, TournamentListState state) {
          if (state is LoadingTournamentListState) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ErrorTournamentListState) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
              child: Center(
                child: Text("An error occurred, please try again later."),
              ),
            );
          } else if (state is SuccessTournamentListState) {
            if (state.data?.success != true || state.data?.data == null) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
                child: Center(
                  child: Text("An error occurred, please try again later."),
                ),
              );
            } else if (state.data?.data?.tournaments == null ||
                state.data!.data!.tournaments.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
                child: Center(
                  child: Text("No data available."),
                ),
              );
            }

            list.addAll(state.data!.data!.tournaments);
            cursor = state.data!.data!.cursor ?? "";
            isLastBatch = state.data!.data!.isLastBatch ?? false;

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data!.data!.isLastBatch!
                  ? list.length
                  : list.length + 1,
              separatorBuilder: (context, index) => const SizedBox(height: 8.0),
              itemBuilder: (BuildContext context, int index) {
                if (index >= list.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return TournamentListTileWidget(
                    tournament: list.elementAt(index),
                  );
                }
              },
            );
          }

          // For any other state:
          return const SizedBox();
        },
      ),
    );
  }

  void _lazyLoadData({
    String? cursor = "",
  }) async {
    // Guard clause to stop the list.
    if (isLastBatch) return;

    // API call
    await tournamentListBloc.getTournamentListData(
      queryparams: {
        "limit": 10,
        "status": "all",
        "cursor": cursor,
      },
    );
  }

  void _onScroll() {
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    final currentScroll = widget.scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200.0) {
      _lazyLoadData(
        cursor: cursor,
      );
    }
  }
}
