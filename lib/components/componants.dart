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

  const CustomSubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.color = primaryColor,
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
            side: const BorderSide(color: Colors.white, width: 1),
          ),
          elevation: 2,
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
                : Text(text, style: AppTextStyles.secondaryStyle),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  // final String labelText;
  final String hintText;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    // required this.labelText,
    required this.hintText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryColor,
      onTap: onTap,
      decoration: InputDecoration(
        fillColor: Colors.white,
        // hoverColor: Colors.white,
        // focusColor: Colors.white,
        filled: true,
        isDense: true, // Reduces the vertical space
        contentPadding: EdgeInsets.symmetric(
          vertical: 7.0.h,
          horizontal: 20.0.w,
        ),
        // labelStyle: TextStyle(color: primaryColor),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: primaryColor),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.white),
        ),
        // labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
