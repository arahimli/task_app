


import 'package:flutter/material.dart';
import '../../../../domain/uses_cases/common/styles.dart';
import '../../../../domain/uses_cases/config/main_colors.dart';

class SmallUnBorderedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? horizontal;
  final double? vertical;
  final double? borderRadius;
  const SmallUnBorderedButton({Key? key, this.onTap, required this.text, this.buttonColor, this.textColor, this.textStyle, this.horizontal, this.vertical, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
            color: buttonColor ?? MainColors.generalColor,
            borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!) : BorderRadius.circular(4),
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(text, textAlign: TextAlign.center, style: textStyle ?? MainStyles.boldTextStyle.copyWith(color: textColor ?? MainColors.white),),
          )),
        ),
      ),
    );
  }
}
