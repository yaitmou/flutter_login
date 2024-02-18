/// The authentication api will handle api calls and will be consumed by the authentication
/// repository. This way we are separating the repo from the api implementation. We can change the
/// API implementation as we please without updating the authentication_repository implementation.
/// That is a pure SOC
