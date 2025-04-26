import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_leaf/src/core/utils/constants/asset_constants/image_path.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';
import 'package:green_leaf/src/feature/home/presentation/components/custom_clipper.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF00F97B).withAlpha(5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      height: AppSizes.height * 0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Color(0xFF00F97B).withAlpha(10),
                  height: AppSizes.height * 0.25,
                  width: AppSizes.width * 0.45,
                ),
              ),
            ),

            Positioned.fill(
              child: SizedBox(
                height: AppSizes.height * 0.25,
                width: double.maxFinite,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Good Morning",
                                  style: AppTextStyles.smallText.copyWith(
                                    fontSize: getWidth(18),
                                  ),
                                ),

                                Text(
                                  "Ahmed Ariyan",
                                  style: AppTextStyles.heading
                                      .copyWith(fontSize: getWidth(22))
                                      .withFont(
                                        GoogleFonts.poppins().fontFamily ??
                                            'DefaultFont',
                                      ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: getWidth(45),
                              backgroundImage: AssetImage(
                                ImagePath.profileImage,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "You are in a ",
                                style: AppTextStyles.smallText,
                              ),
                              TextSpan(
                                text: "healthy",
                                style: AppTextStyles.linkText
                                    .withWeight(FontWeight.bold)
                                    .copyWith(fontSize: getWidth(16)),
                              ),
                              TextSpan(
                                text: " environment",
                                style: AppTextStyles.smallText,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getHeight(12)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
