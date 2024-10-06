import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../theme/colors.dart';

enum ToastType {
  success,
  error,
  warning,
  info,
}

class Toast {
  static void show({
    required String message,
    required ToastType type,
    required BuildContext context,
    Function(String)? onCloseButtonTap,
    Function(String)? onTap,
    Function(String)? onAutoCompleteCompleted,
    Function(String)? onDismissed,
    String? title,
    Duration? duration,
  }) {
    ToastificationType getToastType(ToastType type) {
      switch (type) {
        case ToastType.success:
          return ToastificationType.success;
        case ToastType.error:
          return ToastificationType.error;
        case ToastType.warning:
          return ToastificationType.warning;
        case ToastType.info:
          return ToastificationType.info;
      }
    }

    Widget getIcon(ToastType type) {
      switch (type) {
        case ToastType.success:
          return const Icon(
            Icons.check_circle,
            color: AppColors.success,
          );
        case ToastType.error:
          return const Icon(Icons.error, color: AppColors.danger);
        case ToastType.warning:
          return const Icon(Icons.error, color: AppColors.warning);
        case ToastType.info:
          return const Icon(Icons.error, color: AppColors.info);
      }
    }

    Color getPrimaryColor(ToastType type) {
      switch (type) {
        case ToastType.success:
          return const Color(0xFFC1FFB1);
        case ToastType.error:
          return const Color(0xFFFFA39E);
        case ToastType.warning:
          return const Color(0xFFFFE58F);
        case ToastType.info:
          return const Color(0xFF46A7E6);
      }
    }

    Color getBackgroundColor(ToastType type) {
      switch (type) {
        case ToastType.success:
          return const Color(0xFFC1FFB1);
        case ToastType.error:
          return const Color(0xFFFFA39E);
        case ToastType.warning:
          return const Color(0xFFFFE58F);
        case ToastType.info:
          return const Color(0xFF46A7E6);
      }
    }

    Color getTextColor(ToastType type) {
      switch (type) {
        case ToastType.success:
          return AppColors.success;
        case ToastType.error:
          return AppColors.danger;
        case ToastType.warning:
          return AppColors.warning;
        case ToastType.info:
          return AppColors.info;
      }
    }

    toastification.show(
      context: context,
      type: getToastType(type),
      style: ToastificationStyle.flatColored,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      title: title != null
          ? Text(
              title,
            )
          : null,
      description: Text(
        message,
      ),
      alignment: Alignment.bottomCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: getIcon(type),
      primaryColor: getPrimaryColor(type),
      backgroundColor: getBackgroundColor(type),
      foregroundColor: getTextColor(type),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        ),
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => {
          toastification.dismiss(toastItem),
          onTap != null && onTap(toastItem.id),
        },
        onCloseButtonTap: (toastItem) {
          toastification.dismiss(toastItem);
          onCloseButtonTap != null && onCloseButtonTap(toastItem.id);
        },
        onAutoCompleteCompleted: (toastItem) =>
            onAutoCompleteCompleted?.call(toastItem.id),
        onDismissed: (toastItem) =>
            onDismissed != null && onDismissed(toastItem.id),
      ),
    );
  }
}
