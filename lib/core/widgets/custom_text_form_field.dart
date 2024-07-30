import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.onTap,
    this.obscure = false,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIconPressed,
    this.suffixIcon,
    this.drawBorder = false,
    this.border,
    this.colorText = Colors.white,
    this.isFilled = true,
    this.isWightThem = false,
    this.cursorColor,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool obscure;
  final bool drawBorder;
  final bool isFilled;
  final bool isWightThem;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final void Function()? suffixIconPressed;
  final Color? colorText;
  final Color? cursorColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: cursorColor,
      style: isWightThem ? const TextStyle(color: Colors.black) : null,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
      obscureText: obscure,
      decoration: InputDecoration(
        filled: isFilled,
        fillColor: Colors.grey[800],
        border: drawBorder
            ? border
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
        enabledBorder: drawBorder
            ? border
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: drawBorder
            ? border
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
        labelText: labelText,
        labelStyle: TextStyle(color: colorText),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        suffixIcon: suffixIcon != null
            ? TextButton(onPressed: suffixIconPressed, child: suffixIcon!)
            : null,
      ),
    );
  }
}
