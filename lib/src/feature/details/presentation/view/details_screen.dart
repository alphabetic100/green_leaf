import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/common/common_gradient_status.dart';
import 'package:green_leaf/src/core/utils/constants/asset_constants/icon_paths.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';
import 'package:green_leaf/src/feature/details/presentation/components/custom_app_bar.dart';
import 'package:green_leaf/src/feature/details/presentation/components/details_history_section.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.centerRight,
            colors: [AppColors.primary.withAlpha(10), Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getHeight(30)),
                Row(
                  children: [
                    Text(
                      "652",
                      style: AppTextStyles.linkText.copyWith(
                        fontSize: getWidth(48),
                      ),
                    ),
                    SizedBox(width: getWidth(10)),
                    Column(
                      children: [
                        CommonGradientStatus(status: "13%", isIcon: true),
                        Text(
                          "PPM",
                          style: AppTextStyles.linkText
                              .withWeight(FontWeight.normal)
                              .copyWith(fontSize: getWidth(18)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          width: AppSizes.width * 0.4,
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFF2DF28F),
                          ),
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            return Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 5,
                              width: getWidth(25),
                              color: getStatusColor(index),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: getHeight(30)),
                DetailsHistorySection(),

                //  / SizedBox(height: getHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      height: AppSizes.height * 0.18,
                      width: AppSizes.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(10),
                            spreadRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(),
                          Text(
                            "Person",
                            style: AppTextStyles.heading.copyWith(
                              fontSize: getWidth(20),
                            ),
                          ),

                          SizedBox(
                            height: getHeight(50),
                            width: AppSizes.width * 0.3,
                            child: Stack(
                              children: List.generate(4, (index) {
                                return Positioned(
                                  left: 0 + (24 * index.toDouble()),
                                  child: Container(
                                    padding: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
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
                          SizedBox(),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: AppSizes.height * 0.18,
                      width: AppSizes.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFFA1FFD0), Color(0xFF6ABC93)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(),
                          Text(
                            "Rooms",
                            style: AppTextStyles.heading.copyWith(
                              fontSize: getWidth(20),
                              color: AppColors.white,
                            ),
                          ),

                          Text(
                            "5",
                            style: AppTextStyles.heading
                                .withColor(Colors.white)
                                .copyWith(fontSize: getWidth(55)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Text(
                              "2 of them requires action",
                              style: AppTextStyles.smallText.copyWith(
                                fontSize: getWidth(12),
                                color: AppColors.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(30)),
                Container(
                  height: AppSizes.height * 0.18,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(10),
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppSizes.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Plants",
                              style: AppTextStyles.heading.copyWith(
                                fontSize: getWidth(22),
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: getHeight(10)),
                            Image.asset(
                              IconPaths.leafIcon,
                              height: getHeight(45),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: AppSizes.height * 0.18,
                        width: AppSizes.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xFFA1FFD0), Color(0xFF6ABC93)],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "43",
                            style: AppTextStyles.heading.copyWith(
                              fontSize: getWidth(60),
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

getStatusColor(int index) {
  switch (index) {
    case 0:
      return Color(0xFF7184FF);
    case 1:
      return Color(0xFFFF5557);
    case 2:
      return Color(0xFF2DF28F);
    case 3:
      return Color(0xFFEBED4D);
    case 4:
      return Color(0xFFFA9D5A);
  }
}
