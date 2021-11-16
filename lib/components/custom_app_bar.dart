import 'package:flutter/material.dart';

class CustomAppBar extends AppBar implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    Widget? title,
    WillPopCallback? onWillPop,
    Widget? leading,
    Brightness? brightness,
    Color? backgroundColor,
    List<Widget>? actions,
    bool centerTitle = true,
    double? elevation,
    BuildContext? context,
  }) : super(
          key: key,
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor ?? Colors.white,
          actions: actions,
          elevation: elevation ?? 0.5,
        );
  @override
  get preferredSize => const Size.fromHeight(50);
}
