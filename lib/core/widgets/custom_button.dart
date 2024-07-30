import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  const CustomButon({
    super.key,
    this.height = 50,
    this.width,
    this.radius = 10,
    this.background = Colors.transparent,
    this.onPressed,
    required this.text,
    this.addLogo = false,
    this.isLoading = false,
    this.withBorder = true,
    this.marginHorizontal = 0,
    this.marginBottom = 0,
    this.itemLogo,
    this.colorLoadingIndicator = Colors.white,
  });
  final bool isLoading;
  final bool withBorder;
  final double? height;
  final double? width;
  final double radius;
  final Color? background;
  final void Function()? onPressed;
  final String text;
  final bool addLogo;
  final double marginHorizontal;
  final double marginBottom;
  final Widget? itemLogo;
  final Color? colorLoadingIndicator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: marginHorizontal,
        right: marginHorizontal,
        bottom: marginBottom,
      ),
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        border: withBorder
            ? Border.all(
                color: Colors.grey,
                width: 2,
              )
            : null,
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            isLoading
                ? CircularProgressIndicator(
                    color: colorLoadingIndicator,
                  )
                : Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
            if (addLogo == true && isLoading == false) itemLogo!
          ],
        ),
      ),
    );
  }
}
