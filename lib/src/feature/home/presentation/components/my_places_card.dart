import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/common/common_gradient_status.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';

class MyPlacesCard extends StatelessWidget {
  const MyPlacesCard({
    super.key,
    required this.onTap,
    required this.cardName,
    required this.status,
    required this.value,
    required this.percentage,
    required this.members,
  });
  final String cardName;
  final String status;
  final String value;
  final String percentage;
  final String members;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardName,
                  style: AppTextStyles.formLabel.copyWith(
                    fontSize: getWidth(18),
                  ),
                ),
                CommonGradientStatus(status: status, isIcon: false),
              ],
            ),
            SizedBox(height: getHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      value,
                      style: AppTextStyles.linkText.copyWith(
                        fontSize: getWidth(48),
                      ),
                    ),
                    SizedBox(width: getWidth(10)),
                    Column(
                      children: [
                        CommonGradientStatus(status: percentage, isIcon: true),
                        Text(
                          "PPM",
                          style: AppTextStyles.linkText
                              .withWeight(FontWeight.normal)
                              .copyWith(fontSize: getWidth(18)),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: getHeight(50),
                      width: AppSizes.width * 0.25,
                      child: Stack(
                        children: List.generate(4, (index) {
                          return Positioned(
                            left: 0 + (18 * index.toDouble()),
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: getWidth(15),
                                backgroundColor:
                                    index == 3
                                        ? Color(0xFFD9D9D9)
                                        : Colors.green.shade100,
                                child:
                                    index == 3
                                        ? Text("+5")
                                        : Icon(
                                          Icons.person,
                                          color: AppColors.white,
                                        ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "View details",
                          style: AppTextStyles.linkText.copyWith(
                            fontSize: getWidth(12),
                          ),
                        ),
                        Icon(
                          Icons.play_arrow,
                          color: AppColors.primary,
                          size: getWidth(16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
