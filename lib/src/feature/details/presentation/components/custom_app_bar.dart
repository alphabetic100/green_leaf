import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:green_leaf/src/core/common/common_gradient_status.dart';
import 'package:green_leaf/src/core/utils/constants/asset_constants/icon_paths.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(16),
          vertical: getHeight(10),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                CupertinoIcons.back,
                size: 30,
                color: Color(0xFF838383),
              ),
            ),
            SizedBox(width: getWidth(10)),
            Image.asset(IconPaths.homeIcon, height: getHeight(35)),
            SizedBox(width: getWidth(10)),
            Text(
              "Home",
              style: AppTextStyles.subtitle
                  .withColor(AppColors.textPrimary)
                  .withWeight(FontWeight.normal),
            ),
            Spacer(),
            CommonGradientStatus(status: "Good", isIcon: false),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
