class RegisterState {
  final String email;
  final String password;
  final String username;

  const RegisterState({
    this.email = "",
    this.username = '',
    this.password = "",
  });

  RegisterState copyWith({
    String? email,
    String? username,
    String? password,
  }) {
    return RegisterState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
