import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double width;
  final Color color;
  final bool haveBorder;
  final Color textColor;
  final Widget? icon;

  const CustomSubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.color = primaryColor,
    this.haveBorder = false,
    this.textColor = Colors.black,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.black,
          minimumSize: Size(
            0,
            20.h,
          ), // Minimizes the button height to 40 pixels
          padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 20.0.w),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side:
                haveBorder
                    ? const BorderSide(color: Colors.white, width: 1)
                    : BorderSide.none,
          ),
        ),
        child:
            isLoading
                ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                : icon != null
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon!,
                    const SizedBox(width: 5),
                    Text(
                      text,
                      style: AppTextStyles.smallStyle.copyWith(
                        color: textColor,
                      ),
                    ),
                  ],
                )
                : Text(
                  text,
                  style: AppTextStyles.smallStyle.copyWith(color: textColor),
                ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 100,
            offset: const Offset(20, 50),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: primaryColor,
        onTap: onTap,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 7.0.h,
            horizontal: 20.0.w,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

void navigatAndReturn({required context, required page}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));

void navigatAndFinish({required context, required page}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
