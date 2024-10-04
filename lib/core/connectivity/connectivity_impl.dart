import 'package:connectivity_plus/connectivity_plus.dart';

import 'connectivity.dart';

class InternetConnectivityImpl implements InternetConnectivity {
  InternetConnectivityImpl({
    required this.connectivity,
  });

  final Connectivity connectivity;

  @override
  Future<bool> hasInternet() async {
    final result = await connectivity.checkConnectivity();

    return result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);
  }
}
