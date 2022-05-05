import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';

import 'tournament_list_widget.dart';
import 'user_stats_widget.dart';
import 'user_widget.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          //
          const UserWidget(),
          SizedBox(height: 2.5.h),

          //
          const UserStatsWidget(),
          SizedBox(height: 2.5.h),

          //
          Text(
            AppLocalizations.of(context)?.recommendedforyou ?? '',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),

          // Tournament List:
          TournamentListWidget(
            scrollController: controller,
          ),
        ],
      ),
    );
  }
}
