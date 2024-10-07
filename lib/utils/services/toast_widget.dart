import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme/app_themes.dart';

enum ToastType { success, error, warning }

class ToastWidget extends StatefulWidget {
  final String title;
  final ToastType type;
  final String? description;
  final String? actionButton;
  final Function()? actionButtonOnPressed;
  final Function()? onCloseToast;
  final bool animateDownToUp;
  @override
  // ignore: overridden_fields
  final GlobalKey<ToastWidgetState> key;

  const ToastWidget({
    required this.key,
    required this.title,
    required this.type,
    this.description,
    this.actionButton,
    this.actionButtonOnPressed,
    this.onCloseToast,
    this.animateDownToUp = true,
  }) : super(key: key);

  @override
  ToastWidgetState createState() => ToastWidgetState();
}

class ToastWidgetState extends State<ToastWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 5700), () {
      if (mounted) {
        removeToast();
      }
    });
  }

  void removeToast() {
    if (_controller.isAnimating || _controller.isCompleted) {
      _controller.reverse().then((value) {
        if (mounted) {
          widget.onCloseToast?.call();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorBackground = widget.type == ToastType.success
        ? const Color(0xFFE9F9E6)
        : widget.type == ToastType.error
            ? const Color(0xFFFFE2E0)
            : const Color(0xFFFFF7DE);

    final colorBorder = widget.type == ToastType.success
        ? const Color(0xFFD6F9D0)
        : widget.type == ToastType.error
            ? const Color(0xFFFFC4C1)
            : const Color(0xFFFFEFBD);

    final iconUrl = widget.type == ToastType.success
        ? 'assets/icons/check_circle_icon.svg'
        : widget.type == ToastType.error
            ? 'assets/icons/package_cancel_circle.svg'
            : 'assets/icons/package_warning_circle.svg';

    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 44.0,
            maxHeight: 140.0,
            minWidth: 220.0,
            maxWidth: 320.0,
          ),
          child: GestureDetector(
            onTap: () {
              if (widget.actionButtonOnPressed != null) {
                widget.actionButtonOnPressed!();
              }
            },
            onVerticalDragUpdate: (details) {
              if (details.primaryDelta! < -10) {
                removeToast();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorBackground,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: colorBorder,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(2, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    iconUrl,
                    width: 24,
                    height: 24,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            style: AppTheme.textStyleBody1(context)
                                ?.copyWith(color: const Color(0xFF29354F)),
                          ),
                          if (widget.description != null) const SizedBox(height: 4),
                          if (widget.description != null)
                            Text(
                              widget.description!,
                              style: AppTheme.textStyleBody2(context)?.copyWith(
                                color: const Color(0xFF586893),
                              ),
                            ),
                          if (widget.actionButton != null) const SizedBox(height: 4),
                          if (widget.actionButton != null)
                            Text(
                              widget.actionButton!,
                              style: AppTheme.textStyleBody2(context)?.copyWith(
                                color: const Color(0xFF29354F),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      removeToast();
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFF586893),
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToastService {
  BuildContext context;
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  GlobalKey<ToastWidgetState>? toastKey;

  ToastService(this.context) {
    overlayState = Overlay.of(context);
  }

  void showToast({
    required String title,
    required ToastType type,
    String? description,
    String? actionButton,
    Function()? actionButtonOnPressed,
    bool animateDownToUp = true,
  }) {
    toastKey = GlobalKey<ToastWidgetState>();
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16.0,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ToastWidget(
          key: toastKey!,
          type: type,
          title: title,
          description: description,
          actionButton: actionButton,
          actionButtonOnPressed: actionButtonOnPressed,
          onCloseToast: () {
            overlayEntry?.remove();
          },
          animateDownToUp: animateDownToUp,
        ),
      ),
    );

    overlayState?.insert(overlayEntry!);

    Future.delayed(const Duration(seconds: 6), () {
      toastKey?.currentState?.removeToast();
    });
  }

  static ToastService? of(BuildContext context) {
    return context.findAncestorStateOfType<ToastWidgetState>()?.widget as ToastService?;
  }
}
