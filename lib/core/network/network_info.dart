import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Network connection service
///
/// This service is for hiding the 3rd party library inside our won service. This will simplify
/// library swapping if needed
///
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Implementation of the [NetworkInfo] contract
///
class NetworkInfoImpl implements NetworkInfo {
  /// Depends on an external library `internet_connection_checker`
  NetworkInfoImpl(this.connectionChecker);
  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
