import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../theme/colors.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({
    required this.onTapRetry,
    super.key,
  });

  final VoidCallback onTapRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            width: 150,
            height: 100,
            'assets/images/error_rounded.png',
          ),
          Text(
            'Sem conexão!',
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall,
          ),
          Text(
            '''Parece que sua conexão caiu!''',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: 16,),
          TextButton.icon(
            onPressed: onTapRetry,
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              'Textar novamente!',
              style: context.textTheme.labelLarge?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
