import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphical_abstract/theme/color.dart';

class TextInput extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? labelText;
  final IconData? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final String? helperText;
  final bool? isPassword;
  final Color? fillColor;
  final TextCapitalization? capitalize;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  final bool enabled;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final Widget? prefixWidget;
  final double? borderRadius;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final Function(String?)? onSubmitted;
  final int maxLines;
  const TextInput({super.key, this.onSubmitted, this.onChanged, this.fillColor, this.initialValue, this.hintText, this.labelText, this.helperText, this.suffixIcon, this.suffixWidget, this.isPassword = false, this.keyboardType, this.enabled = true, this.controller, this.focusNode, this.inputFormatters, this.autofillHints, this.prefixWidget, this.borderRadius, this.contentPadding, this.capitalize, this.padding, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: TextFormField(
        obscureText: isPassword!,
        textCapitalization: capitalize ?? TextCapitalization.none,
        focusNode: focusNode,
        controller: controller,
        initialValue: initialValue,
        keyboardType: keyboardType,
        enableSuggestions: true,
        enabled: enabled,
        inputFormatters: inputFormatters,
        autofillHints: autofillHints,
        onChanged: onChanged,
        maxLines: maxLines,
        keyboardAppearance: Brightness.light,
        onFieldSubmitted: (e) => onSubmitted != null ? onSubmitted!(e) : null,
        style: TextStyle(color: UiColor.primaryTextColor, fontSize: 17, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          prefixIcon: prefixWidget,
          fillColor: fillColor ?? Colors.white,
          suffixIcon: suffixWidget ?? (suffixIcon != null ? Icon(suffixIcon, color: UiColor.primaryTextColor) : null),
          labelText: labelText,
          hintText: hintText,
          border: borderRadius != null ? OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
          helperText: helperText,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: UiColor.primaryTextColor),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: UiColor.primaryTextColor, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
