import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final TextEditingController? controller;
  final bool canTapOutside;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.canTapOutside = false,
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
        obscureText: obscureText,
        controller: controller,
        cursorColor: primaryColor,
        validator: validator,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onTap: onTap,
        onTapOutside: (event) {
          if (canTapOutside) {
            return;
          }
          FocusManager.instance.primaryFocus?.unfocus();
        },

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
          hintStyle: AppTextStyles.smallStyle,
        ),
      ),
    );
  }
}

class CustomDropdownMenu<T> extends StatelessWidget {
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool canTapOutside;

  const CustomDropdownMenu({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.canTapOutside = false,
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
      child: DropdownButtonFormField<T>(
        dropdownColor: Colors.white,
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          fillColor: appbar,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 5.0.h,
            horizontal: 5.0.w,
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
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        hint: Text(hintText, style: AppTextStyles.smallStyle),
        style: AppTextStyles.smallStyle,
        onTap: () {
          if (!canTapOutside) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
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

void showToast({
  required String msg,
  required ToastStates state,
  ToastGravity gravity = ToastGravity.TOP,
}) => Fluttertoast.showToast(
  msg: msg,
  toastLength: Toast.LENGTH_SHORT,
  gravity: gravity,
  timeInSecForIosWeb: 1,
  backgroundColor: choseToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);

enum ToastStates { success, error, warning }

Color choseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;

    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}
