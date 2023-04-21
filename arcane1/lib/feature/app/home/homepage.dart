import 'package:arcane1/feature/app/app_constant/colors.dart';
import 'package:arcane1/feature/app/app_constant/page_constant.dart';
import 'package:arcane1/feature/app/home/home_button_widegt.dart';
import 'package:arcane1/feature/global/common/small_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/app_logo.png",
                ),
              ],
            ),
            Column(
              children: [
                HomeButtonWidget(
                  textData: "I'm ChatGPT-OpenAI Ask me anything...",
                  iconData: Icons.text_fields_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, PageConstant.arcane1);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                HomeButtonWidget(
                  textData: "I'm Dalli-OpenAI Ask me to draw any image...",
                  iconData: Icons.image_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, PageConstant.arcane2);
                  },
                ),
              ],
            ),
            SmallText(
              text: "Optimizing Language Models for Dailouge Application.",
              color: whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
