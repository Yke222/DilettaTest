import 'package:flutter/material.dart';

class AppLoading extends StatefulWidget {
  const AppLoading({
    super.key,
    this.child = const SizedBox.shrink(),
    this.loading = true,
  });

  final Widget child;
  final bool loading;

  @override
  State<StatefulWidget> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        if (widget.loading)
          ColoredBox(
            color: Colors.black.withOpacity(.6),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
