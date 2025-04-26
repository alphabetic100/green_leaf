import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';
import 'package:green_leaf/src/feature/details/presentation/view/details_screen.dart';
import 'package:green_leaf/src/feature/home/presentation/components/my_places_card.dart';
import 'package:green_leaf/src/feature/home/presentation/components/profile_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Column(
          children: [
            ProfileCard(),
            SizedBox(height: getHeight(35)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Places",
                    style: AppTextStyles.smallText
                        .withColor(AppColors.textPrimary)
                        .copyWith(fontSize: getWidth(16)),
                  ),
                  SizedBox(height: getHeight(20)),
                  MyPlacesCard(
                    onTap: () => Get.to(() => DetailsScreen()),
                    cardName: "Home",
                    status: "Good",
                    value: "652",
                    percentage: "13%",
                    members: "2",
                  ),
                  SizedBox(height: getHeight(20)),
                  MyPlacesCard(
                    onTap: () => Get.to(() => DetailsScreen()),
                    cardName: "Office",
                    status: "Healthy",
                    value: "447",
                    percentage: "37%",
                    members: "47",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
