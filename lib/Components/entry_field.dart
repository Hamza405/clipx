import 'package:flutter/material.dart';
import 'package:pocketmovies/Theme/colors.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? image;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Function() onTap;
  final TextCapitalization? textCapitalization;

  EntryField({
    this.controller,
    this.label,
    this.image,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.prefix,
    this.maxLines,
    this.suffixIcon,
    required this.onTap,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      cursorColor: mainColor,
      onTap: onTap,
      autofocus: false,
      controller: controller,
      initialValue: initialValue,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      minLines: 1,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefix: prefix,
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: unselectedLabelColor),
        hintText: hint,
        hintStyle: TextStyle(color: lightTextColor),
        counter: Offstage(),
        icon: (image != null)
            ? ImageIcon(
                AssetImage(image!),
                color: mainColor,
                size: 20.0,
              )
            : null,
      ),
    );
  }
}
