import 'package:NudgeBuddy/constants/colors.dart';
import 'package:NudgeBuddy/controllers/auth.dart';
import 'package:NudgeBuddy/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// SignupIndicator class renders the indicator for the signup flow - the dots at the bottom of the screen - last page
// ==================================================================================================================================================================
class SignupIndicator extends StatelessWidget {
  const SignupIndicator({
    Key? key,
    required this.cont,
  }) : super(key: key);

  final AuthController cont;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          3,
          (index) => Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              margin: EdgeInsets.only(
                  right: index == 2 ? 0 : SizeConfig.widthMultiplier * 3),
              height: SizeConfig.heightMultiplier * 1.5,
              width: SizeConfig.widthMultiplier * 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
                color: cont.currentSection.value == index
                    ? ColorConstants.primaryColor
                    : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
