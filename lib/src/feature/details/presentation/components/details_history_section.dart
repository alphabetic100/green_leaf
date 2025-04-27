import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';
import 'package:green_leaf/src/feature/details/presentation/components/monthly_graph.dart';

class DetailsHistorySection extends StatelessWidget {
  const DetailsHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("History", style: AppTextStyles.smallText),
            Spacer(),
            Text("See all", style: AppTextStyles.smallText),
            Icon(
              Icons.play_arrow,
              color: AppColors.textSecondary,
              size: getWidth(20),
            ),
          ],
        ),
        SizedBox(height: getHeight(20)),
        SizedBox(
          height: AppSizes.height * 0.3,
          width: double.maxFinite,
          child: MonthlyGraph(),
        ),
        SizedBox(height: getHeight(10)),
      ],
    );
  }
}
