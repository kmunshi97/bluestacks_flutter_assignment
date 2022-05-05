import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget subtitleWidget({
  required BuildContext context,
  String caption = "",
  String title = "-",
  bool? isCentered = true,
  Color? color,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment:
        isCentered! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
    children: [
      //
      Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: color,
            ),
      ),

      const SizedBox(height: 8),

      //
      Text(
        caption,
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        style: Theme.of(context).textTheme.caption!.copyWith(
              fontSize: 10.sp,
              color: color,
            ),
      ),
    ],
  );
}
