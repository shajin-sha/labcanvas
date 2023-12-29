import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphical_abstract/view/elements/button.dart';

class AlertBox {
  static showAlert(
    BuildContext context, {
    required String title,
    required String message,
    required String fistButtonTitle,
    String? secondButtonTitle,
    Function? onFirstButtonPressed,
    Function? onSecondButtonPressed,
    ButtonType firstButtonType = ButtonType.negative,
    ButtonType secondButtonType = ButtonType.secondary,
    double height = 300,
    Widget? child,
    Color backDropColor = Colors.black87,
    Duration transitionDuration = const Duration(milliseconds: 120),
    Function? onDismissed,
    Function? customHapticFeedback,
  }) {
    Future.delayed(const Duration(milliseconds: 100), () => customHapticFeedback != null ? customHapticFeedback() : HapticFeedback.lightImpact());
    showGeneralDialog(
      barrierLabel: 'Alert',
      barrierDismissible: true,
      barrierColor: backDropColor,
      transitionDuration: transitionDuration,
      useRootNavigator: true,
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
              child: Container(
            height: message.length > 80
                ? ResponsiveHelpers.isDesktop(context)
                    ? height + 100
                    : height + 50
                : height,
            margin: EdgeInsets.symmetric(horizontal: (ResponsiveHelpers.isMobile(context)) ? ResponsiveHelpers.width(context) * 0.08 : ResponsiveHelpers.width(context) * 0.35),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10, offset: const Offset(0, 10))]),
            child: SizedBox.expand(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: ResponsiveHelpers.isMobile(context) ? 22 : 25, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (child != null) child,
                  const SizedBox(height: 30),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: (secondButtonTitle != null && secondButtonTitle != "") ? 10 : 10,
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Visibility(
                            visible: (secondButtonTitle == null || secondButtonTitle == ""),
                            maintainState: false,
                            child: const SizedBox(
                              height: 20,
                            ),
                          ),
                          Expanded(
                            child: Button(
                              title: fistButtonTitle,
                              textStyle: firstButtonType == ButtonType.secondary ? const TextStyle(color: Colors.black) : null,
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                if (onFirstButtonPressed != null) {
                                  onFirstButtonPressed();
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              width: double.infinity,
                              buttonType: firstButtonType,
                            ),
                          ),
                          Visibility(
                            visible: (secondButtonTitle == null || secondButtonTitle == ""),
                            maintainState: false,
                            child: const Spacer(),
                          ),
                          Visibility(visible: (secondButtonTitle != null && secondButtonTitle != ""), maintainState: false, child: const SizedBox(height: 10)),
                          Visibility(
                              visible: (secondButtonTitle != null && secondButtonTitle != ""),
                              maintainState: false,
                              child: Expanded(
                                  child: Button(
                                title: secondButtonTitle,
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                  if (onSecondButtonPressed != null) {
                                    onSecondButtonPressed();
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                width: double.infinity,
                                buttonType: secondButtonType,
                                textStyle: const TextStyle(color: Colors.black),
                              ))),
                          ResponsiveHelpers.isDesktop(context)
                              ? const SizedBox(
                                  height: 20,
                                )
                              : const SizedBox(
                                  height: 0,
                                )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
      transitionBuilder: (context, anim, secondaryAnimation, child) {
        final tween = Tween<double>(begin: 0.85, end: 1.0);
        anim = tween.animate(anim);
        anim = CurvedAnimation(parent: anim, curve: Curves.fastOutSlowIn);

        return ScaleTransition(
          scale: anim,
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  static showCustomDialog(
    BuildContext context, {
    double height = 500,
    Widget? child,
    Color backDropColor = Colors.black87,
    Duration transitionDuration = const Duration(milliseconds: 120),
    Function? onDismissed,
    Function? customHapticFeedback,
  }) {
    Future.delayed(const Duration(milliseconds: 100), () => customHapticFeedback != null ? customHapticFeedback() : HapticFeedback.lightImpact());
    showGeneralDialog(
      barrierLabel: 'Alert',
      barrierDismissible: true,
      barrierColor: backDropColor,
      transitionDuration: transitionDuration,
      useRootNavigator: true,
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              height: height,
              margin: EdgeInsets.symmetric(horizontal: (ResponsiveHelpers.isMobile(context)) ? ResponsiveHelpers.width(context) * 0.08 : ResponsiveHelpers.width(context) * 0.35),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10, offset: const Offset(0, 10))]),
              child: SizedBox.expand(
                child: Padding(padding: const EdgeInsets.all(10.0), child: child),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim, secondaryAnimation, child) {
        final tween = Tween<double>(begin: 0.85, end: 1.0);
        anim = tween.animate(anim);
        anim = CurvedAnimation(parent: anim, curve: Curves.fastOutSlowIn);

        return ScaleTransition(
          scale: anim,
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}

class ResponsiveHelpers {
  //* This class helps us to make our platform responsive by providing us many useful functions.

  //* Functions to check & breakpoints checking for for different screens sizes (Mobile, Tablet, Desktop)
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1000;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1000;

  //* Returns true if the screen width is less than the given width
  static bool isWidthLessThan(BuildContext context, double width) => MediaQuery.of(context).size.width < width;

  //* Returns true if the screen height is less than the given height
  static bool isHeightLessThan(BuildContext context, double height) => MediaQuery.of(context).size.height < height;

  //* STATIC BREAKPOINTS of different screens sizes
  static double mobileBrakePoint = 600;
  static double tabletBrakePoint = 1024;
  static double desktopBrakePoint = 1440;

  // Return width
  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  // Return height
  static double height(BuildContext context) => MediaQuery.of(context).size.height;
}
