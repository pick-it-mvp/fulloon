import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juction/app/core/theme/color_theme.dart';
import 'package:juction/app/widgets/util/cached_image.dart';

import '../../../core/theme/global_text_util.dart';
import '../../../data/models/user.dart';

class ChatProfileWidget extends StatelessWidget {
  final User user;

  const ChatProfileWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 35.w,
          height: 35.w,
          decoration: const BoxDecoration(
            color: PickItColors.c000000,
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.hardEdge,
          child: CachedImage(
            url: user.profileImgUrl ?? GlobalTextUtil.defaultImgUrl,
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(user.nickName),
        if (user.babyDate != null)
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Text(
              "${user.babyDate!}주",
              style: style,
            ),
          ),
      ],
    );
  }
}
