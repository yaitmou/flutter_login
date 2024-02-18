import 'package:flutter_login/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    // We are hiding the party library (internet_connection_checker) inside our own interface. This
    // will allow us to safely swat the 3rd party library with an other one in the future
    // However, we need to test that the call to our interface, indeed, results in the call of the
    // 3rd party library:
    test('Should forward the call form our service to DataConnectionChecker.isConnected', () async {
      // arrange
      final tHasConnectionFuture = Future.value(true);
      when(() => mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      // act
      final result = networkInfo.isConnected;
      // assert
      verify(() => mockInternetConnectionChecker.hasConnection).called(1);
      expect(result, tHasConnectionFuture);
      verifyNoMoreInteractions(mockInternetConnectionChecker.hasConnection);
    });
  });
}
