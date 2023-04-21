import 'package:arcane1/feature/app/app_constant/colors.dart';
import 'package:arcane1/feature/global/common/small_text.dart';
import 'package:flutter/material.dart';
import '../../global/common/common.dart';

class HomeButtonWidget extends StatelessWidget {
  final String textData;
  final IconData iconData;
  final VoidCallback? onTap;
  const HomeButtonWidget({
    super.key,
    required this.textData,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: chatBackGround,
          borderRadius: BorderRadius.circular(10),
          boxShadow: glowBoxShadow,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(
              text: textData,
              color: whiteColor,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
