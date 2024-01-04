import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logistics_now/core/theme/color_constants.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isNumber;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final bool isAutoFocus;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final bool shouldHideText;
  final double? height;
  final double? width;
  final double? spacing;
  final List<TextInputFormatter>? inputFormatters;
  final String imagePath;
  final TextStyle? textStyle;
  final EdgeInsets? contentPadding;

  const CustomTextField({
    super.key,
    this.labelText,
    this.controller,
    this.focusNode,
    this.isNumber = false,
    this.maxLength,
    this.keyboardType,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.isAutoFocus = false,
    this.isReadOnly = false,
    this.onTap,
    this.shouldHideText = false,
    this.height = 45,
    this.width,
    this.spacing,
    this.imagePath = '',
    this.inputFormatters,
    this.textStyle,
    this.contentPadding,
  });

  final bool _isHideTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: isAutoFocus,
        cursorColor: Colors.white,
        style: textStyle ??
            TextStyle(
                fontSize: 18, letterSpacing: spacing, color: Colors.white),
        keyboardType: isNumber ? TextInputType.number : keyboardType,
        textCapitalization: textCapitalization,
        readOnly: isReadOnly,
        onTap: onTap,
        obscureText: !_isHideTextVisible && shouldHideText,
        inputFormatters: [
          if (inputFormatters != null)
            ...?inputFormatters
          else if (isNumber)
            FilteringTextInputFormatter.digitsOnly,
        ],
        maxLength: maxLength,
        maxLines: maxLines,
        scrollPadding: const EdgeInsets.only(bottom: 180),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.primary),
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          counterText: "",
          alignLabelWithHint: true,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
          labelText: labelText,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                horizontal: 20,
                vertical: maxLines <= 1 ? 10 : 4,
              ),
        ),
      ),
    );
  }
}
