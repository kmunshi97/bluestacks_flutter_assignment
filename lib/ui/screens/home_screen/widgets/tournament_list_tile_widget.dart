import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../logic/blocs/tournament_list_bloc/tournament_list_bloc.dart';

class TournamentListTileWidget extends StatelessWidget {
  final Tournament? tournament;

  const TournamentListTileWidget({
    Key? key,

    //
    required this.tournament,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      elevation: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Cover Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: tournament?.coverUrl ?? "",
            ),
          ),

          //
          ListTile(
            title: Text(tournament?.name ?? ""),
            subtitle: Text(tournament?.gameName ?? ""),
            trailing: IconButton(
              onPressed: () => _handleIconOnPressed(context),
              icon: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }

  void _handleIconOnPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Feature out of scope of the coding assignment."),
      ),
    );
    return;
  }
}
