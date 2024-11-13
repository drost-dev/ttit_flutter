abstract class AbstractDatabaseRepo {
  void signUp(
    String name,
    String email,
    String password,
  );

  void signIn(
    String email,
    String password,
  );

  void trySignOut();

  void signInOtp(String email);

  void verifyOtp(
    String email,
    String otpCode,
  );
}
