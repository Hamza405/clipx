import 'package:flutter/material.dart';
import 'package:pocketmovies/Theme/colors.dart';

class ButtonWithIcon extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Color borderColor;
  final String image;
  final String label;
  final Function onTap;
  final Icon icon;

  ButtonWithIcon({
    this.color,
    this.textColor,
    this.image,
    this.label,
    this.borderColor,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton.icon(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: borderColor ?? transparentColor,
            width: 0.5,
          ),
        ),
        color: color ?? transparentColor,
        onPressed: onTap ?? () {},
        icon: Padding(
          padding: EdgeInsets.all(14.0),
          child: icon ??
              Image.asset(
                image,
                scale: 3,
              ),
        ),
        label: Text(
          label,
          style:
              Theme.of(context).textTheme.bodyText1.copyWith(color: textColor),
        ),
      ),
    );
  }
}
