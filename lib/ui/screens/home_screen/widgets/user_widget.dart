import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(24.w),
          ),
          child: CachedNetworkImage(
            width: 24.w,
            height: 24.w,
            imageUrl:
                "https://www.talkhouse.com/wp-content/uploads/2018/05/Simon-Baker-Talkhouse-Film.jpeg",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),

        const SizedBox(width: 16.0),

        //
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Simon Baker",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 16),

            //

            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF4C6BF6),
                  width: 1.25,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(36),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "2250 ",
                    style: TextStyle(
                      color: const Color(0xFF4C6BF6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)?.elo ?? "",
                    style: const TextStyle(
                      color: Color(0xFF666F90),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
