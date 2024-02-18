/// the authentication_repository library should hold all authentication (dart pure) logic. Tha
/// should include calling api endpoints at /api/auth/....
///
/// Post requests
/// ----------------------------------------------
/// login             /api/auth/login
/// register          /api/auth/register
/// logout            /api/auth/logout
/// forgotPass        /api/auth/forgot-pass
/// activateAccount   /api/auth/activate-account
///
library authentication_repository;

export 'src/authentication_repository.dart';
