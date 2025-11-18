class GoogleLoginState {
  final bool isLoading;
  final bool isLoggedIn;
  final String? name;
  final String? email;
  final String? uid;
  final String? token;
  final String? error;

  GoogleLoginState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.name,
    this.email,
    this.uid,
    this.token,
    this.error,
  });

  GoogleLoginState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? name,
    String? email,
    String? uid,
    String? token,
    String? error,
  }) {
    return GoogleLoginState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}
