import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphical_abstract/theme/color.dart';
import 'package:graphical_abstract/theme/theme_const.dart';

class Button extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final TextStyle? textStyle;
  final ButtonType buttonType;
  final bool isLoading;
  final double width;
  final double? height;
  const Button({
    super.key,
    this.title,
    this.width = 100,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.textStyle,
    this.buttonType = ButtonType.primary,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: isDisabled
          ? SystemMouseCursors.forbidden
          : isLoading
              ? SystemMouseCursors.wait
              : SystemMouseCursors.click,
      onTap: () {
        if (onPressed != null && !isDisabled && !isLoading) {
          onPressed!();
        }
      },
      child: Container(
        height: height,
        padding: const EdgeInsets.all(15),
        width: width,
        decoration: BoxDecoration(
          color: isDisabled
              ? const Color.fromARGB(26, 121, 121, 121)
              : buttonType == ButtonType.primary
                  ? UiColor.primaryColor
                  : buttonType == ButtonType.secondary
                      ? UiColor.greyColor
                      : buttonType == ButtonType.positive
                          ? UiColor.successColor
                          : buttonType == ButtonType.negative
                              ? UiColor.errorColor
                              : buttonType == ButtonType.warning
                                  ? UiColor.warningColor
                                  : UiColor.primaryColor,
          borderRadius: BorderRadius.circular(ThemeConst.defaultBorderRadiusSmall),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            if (isLoading) CupertinoActivityIndicator(color: UiColor.extraDarkGreyColor),
            if (isLoading) const Spacer(),
            if (!isLoading && title != null)
              Text(
                title!,
                style: textStyle ??
                    TextStyle(
                      color: isDisabled
                          ? UiColor.primaryTextColor
                          : buttonType == ButtonType.secondary
                              ? UiColor.primaryTextColor
                              : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            if (icon != null && !isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(icon,
                    color: isDisabled
                        ? UiColor.primaryTextColor
                        : buttonType == ButtonType.secondary
                            ? UiColor.primaryTextColor
                            : textStyle?.color ?? Colors.white,
                    size: 16),
              ),
            if (!isLoading) const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DesignWalahIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double borderRadius;
  final ButtonType buttonType;
  final bool showOutline;
  const DesignWalahIconButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius = 50,
    this.iconColor,
    this.icon = Icons.close,
    this.showOutline = false,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: UiColor.greyColor, width: 1),
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: onPressed,
        child: borderRadius >= 50
            ? CircleAvatar(
                backgroundColor: backgroundColor ?? Colors.white,
                child: Icon(icon, color: iconColor ?? UiColor.primaryColor),
              )
            : Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor ?? UiColor.primaryColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: showOutline
                      ? Border.all(
                          color: buttonType == ButtonType.primary
                              ? UiColor.primaryColor
                              : buttonType == ButtonType.secondary
                                  ? UiColor.greyColor
                                  : buttonType == ButtonType.positive
                                      ? UiColor.successColor
                                      : buttonType == ButtonType.negative
                                          ? UiColor.errorColor
                                          : buttonType == ButtonType.warning
                                              ? UiColor.warningColor
                                              : UiColor.primaryColor,
                          width: 1,
                        )
                      : null,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor ?? UiColor.primaryColor,
                ),
              ),
      ),
    );
  }
}

//Types of buttons:
enum ButtonType {
  primary,
  secondary,
  positive,
  negative,
  warning,
}
