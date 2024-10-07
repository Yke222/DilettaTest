import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wishlist/config/theme/app_colors.dart';

class TextInputWidget extends StatefulWidget {
  final Key? customKey;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Color defaultBorderColor;
  final Color focusBorderColor;
  final Color errorBorderColor;
  final Widget? error;
  final String hintText;
  final String? title;
  final Widget? widgetTitle;
  final TextInputType keyboardType;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? maxLength;
  final int? borderRadius;
  final double paddingHorizontal;
  final bool enabled;
  final bool enableSuggestions;
  final String? Function(String?)? validator;
  final double? cursorHeight;
  final Iterable<String>? autofillHints;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final bool obscureText;
  final TextInputAction textInputAction;
  final Widget? Function(BuildContext,
      {required int currentLength, required bool isFocused, required int? maxLength})? buildCounter;

  const TextInputWidget({
    super.key,
    this.customKey,
    required this.focusNode,
    required this.controller,
    this.defaultBorderColor = AppColors.textSecondary,
    this.focusBorderColor = AppColors.textPrimary,
    this.errorBorderColor = const Color(0xFFD0021B),
    this.error,
    required this.hintText,
    this.title = "",
    this.widgetTitle,
    required this.keyboardType,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.enabled = true,
    this.enableSuggestions = true,
    this.paddingHorizontal = 16.0,
    this.validator,
    this.maxLength,
    this.borderRadius = 12,
    this.buildCounter,
    this.cursorHeight,
    this.autofillHints,
    this.onTapOutside,
    this.onTap,
    this.onEditingComplete,
    this.onChanged,
    this.contentPadding,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.title != null && widget.title!.isNotEmpty && widget.widgetTitle == null,
          child: Padding(
            key: widget.customKey,
            padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal),
            child: Text(
              widget.title!,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.widgetTitle != null,
          child: widget.widgetTitle ?? Container(),
        ),
        Visibility(
          visible: widget.title != null && widget.title!.isNotEmpty,
          child: const SizedBox(
            height: 6,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal),
          child: TextFormField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            decoration: InputDecoration(
              fillColor: AppColors.background,
              isDense: true,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
              filled: true,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
              error: widget.error,
              errorMaxLines: widget.error == null ? 3 : null,
              errorStyle: widget.error == null
                  ? const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 144, 80, 80),
                    )
                  : null,
              suffixIcon: widget.suffixIcon,
              suffixIconConstraints: widget.suffixIconConstraints,
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: widget.prefixIconConstraints,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabled: widget.enabled,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius!.toDouble()),
                ),
                borderSide: BorderSide(
                  color: widget.defaultBorderColor,
                  width: 1,
                ),
                gapPadding: 5,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius!.toDouble()),
                ),
                borderSide: BorderSide(
                  color: widget.defaultBorderColor,
                  width: 1,
                ),
                gapPadding: 5,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius!.toDouble()),
                ),
                borderSide: BorderSide(
                  color: widget.defaultBorderColor,
                  width: 1,
                ),
                gapPadding: 5,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius!.toDouble()),
                ),
                borderSide: BorderSide(
                  color: widget.errorBorderColor,
                  width: 1,
                ),
                gapPadding: 5,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius!.toDouble()),
                ),
                borderSide: BorderSide(
                  color: widget.errorBorderColor,
                  width: 1,
                ),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius!.toDouble()),
                ),
                borderSide: BorderSide(
                  color: widget.focusBorderColor,
                  width: 1,
                ),
                gapPadding: 5,
              ),
              focusColor: widget.focusBorderColor,
            ),
            obscureText: widget.obscureText,
            cursorHeight: widget.cursorHeight,
            validator: widget.validator,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            keyboardType: widget.keyboardType,
            buildCounter: widget.buildCounter,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
            enableSuggestions: widget.enableSuggestions,
            onTapOutside: (controller) {
              widget.onTapOutside?.call(controller);
              widget.focusNode.unfocus();
            },
            onTap: () {
              widget.onTap?.call();
              if (widget.controller.selection.baseOffset == 0 &&
                  widget.controller.selection.extentOffset == widget.controller.text.length) {
                widget.controller.selection =
                    TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));
              }
              widget.focusNode.requestFocus();
            },
            onEditingComplete: () {
              widget.onEditingComplete?.call();
            },
            onChanged: (value) {
              widget.onChanged?.call(value);
            },
            textInputAction: widget.textInputAction,
            autofillHints: widget.autofillHints,
            
          ),
        ),
      ],
    );
  }
}
