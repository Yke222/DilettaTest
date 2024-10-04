import 'package:flutter/material.dart';
import '/../core/core.dart';
import '../../../ui/theme/colors.dart';
import '../../../ui/widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      loading: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá',
                    style: context.textTheme.displaySmall,
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
