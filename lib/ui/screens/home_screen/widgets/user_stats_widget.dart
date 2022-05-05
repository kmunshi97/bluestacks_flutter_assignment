import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/text_widgets.dart';

class UserStatsWidget extends StatelessWidget {
  const UserStatsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 12.5.h,
            margin: const EdgeInsets.only(right: 2.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  const Color(0xFFEE7A00).withOpacity(0.985), // 1
                  const Color(0xFFF4A400).withOpacity(0.95), // 2
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                topLeft: Radius.circular(16.0),
              ),
            ),
            child: subtitleWidget(
              context: context,
              title: "34",
              caption: AppLocalizations.of(context)?.played ?? "",
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 12.5.h,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  const Color(0xFF3B228F).withOpacity(0.985), // 1
                  const Color(0xFF9C5AB9).withOpacity(0.95), // 2
                ],
              ),
            ),
            child: subtitleWidget(
              context: context,
              title: "09",
              caption: AppLocalizations.of(context)?.won ?? "",
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 12.5.h,
            margin: const EdgeInsets.only(left: 2.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  const Color(0xFFF86145).withOpacity(0.975), // 1
                  const Color(0xFFF7874B).withOpacity(0.95), // 2
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: subtitleWidget(
              context: context,
              title: "26%",
              caption: AppLocalizations.of(context)?.winpercent ?? "",
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
