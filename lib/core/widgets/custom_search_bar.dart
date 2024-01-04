import 'package:flutter/material.dart';
import 'package:logistics_now/core/theme/color_constants.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  final String hint;
  final TextEditingController? searchController;
  final bool haveBgColor;
  final bool showSuffixIcon;
  final bool showPrefixIcon;
  final double? outsidePadding;
  final double? borderRadius;
  const CustomSearchBar(
      {super.key,
      required this.onChanged,
      this.hint = "Search",
      this.haveBgColor = true,
      this.showPrefixIcon = false,
      this.showSuffixIcon = true,
      this.outsidePadding,
      this.borderRadius,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: outsidePadding ?? 16),
        child: TextField(
          onChanged: onChanged,
          controller: searchController,
          cursorColor: Colors.black87,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            fillColor:
                haveBgColor ? ColorConstants.searchBarBgColor : Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 80)),
              borderSide: !haveBgColor
                  ? const BorderSide(width: 1, color: Colors.green)
                  : BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 80)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 80)),
              borderSide: !haveBgColor
                  ? BorderSide(width: 1, color: Colors.blue.shade400)
                  : BorderSide.none,
            ),
            hintText: hint,
            hintStyle:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.blue[600]),
            errorText: null,
            prefixIcon: showPrefixIcon
                ? Icon(
                    Icons.search_rounded,
                    color: Colors.blue[600],
                  )
                : null,
            suffixIcon: showSuffixIcon
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: const Color.fromARGB(255, 170, 39, 46),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
