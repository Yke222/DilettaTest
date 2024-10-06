import 'package:flutter/material.dart';
import '/../core/core.dart';

import '../../theme/colors.dart';

class TextfieldWidget extends StatefulWidget {
  
  final TextInputType inputType;
  final bool disabled;
  final Widget? suffix;
  final Widget? prefix;
  final bool? autoFocus;
  final ValueChanged<String?>? onChange;
  final TextEditingController? controller;
  final String? label;

  const TextfieldWidget({
    this.disabled = false,
    this.inputType = TextInputType.text,
    this.suffix,
    this.prefix,
    this.autoFocus,
    this.onChange,
    this.controller,
    this.label,
    super.key,
  });

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.black,
      cursorHeight: 24,
      autofocus: widget.autoFocus ?? false,
      style: context.textTheme.displaySmall,
      controller: widget.controller,
      maxLines: 1,
      keyboardType: widget.inputType,
      obscureText: widget.inputType == TextInputType.visiblePassword,
      onChanged: (newValue) {
        if (widget.onChange != null) {
          widget.onChange?.call(newValue);
        }
      },
      enabled: !widget.disabled,
      decoration: InputDecoration(
        suffixIcon: widget.suffix,
        prefixIcon: widget.prefix,
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColors.gray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColors.info,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColors.danger,
          ),
        ),
        fillColor: Colors.transparent,
        filled: true,
        label: Text(widget.label ?? '') ,
        hintStyle: context.textTheme.labelLarge,
      ),
    );
  }
}
