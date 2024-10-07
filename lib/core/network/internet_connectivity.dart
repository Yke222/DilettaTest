import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
  Future<bool> hasInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
