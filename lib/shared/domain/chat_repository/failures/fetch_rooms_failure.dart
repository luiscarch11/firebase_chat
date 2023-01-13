typedef FetchRoomsFailureServerError = _FetchRoomsFailureServerError;
typedef FetchRoomsFailureUnextistingUser = _FetchRoomsFailureUnextistingUser;

abstract class FetchRoomsFailure {
  const FetchRoomsFailure();
  factory FetchRoomsFailure.serverError() = _FetchRoomsFailureServerError;
  factory FetchRoomsFailure.unextistingUser() = _FetchRoomsFailureUnextistingUser;

  void when({
    required void Function(FetchRoomsFailureServerError) serverError,
    required void Function(FetchRoomsFailureUnextistingUser) unextistingUser,
  }) {
    if (this is _FetchRoomsFailureServerError) {
      return serverError.call(this as _FetchRoomsFailureServerError);
    }

    if (this is _FetchRoomsFailureUnextistingUser) {
      return unextistingUser.call(this as _FetchRoomsFailureUnextistingUser);
    }

    serverError.call(this as _FetchRoomsFailureServerError);
  }

  R map<R>({
    required R Function(FetchRoomsFailureServerError) serverError,
    required R Function(FetchRoomsFailureUnextistingUser) unextistingUser,
  }) {
    if (this is _FetchRoomsFailureServerError) {
      return serverError.call(this as _FetchRoomsFailureServerError);
    }

    if (this is _FetchRoomsFailureUnextistingUser) {
      return unextistingUser.call(this as _FetchRoomsFailureUnextistingUser);
    }

    return serverError.call(this as _FetchRoomsFailureServerError);
  }

  void maybeWhen({
    void Function(FetchRoomsFailureServerError)? serverError,
    void Function(FetchRoomsFailureUnextistingUser)? unextistingUser,
    required void Function() orElse,
  }) {
    if (this is _FetchRoomsFailureServerError && serverError != null) {
      return serverError.call(this as _FetchRoomsFailureServerError);
    }

    if (this is _FetchRoomsFailureUnextistingUser && unextistingUser != null) {
      return unextistingUser.call(this as _FetchRoomsFailureUnextistingUser);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(FetchRoomsFailureServerError)? serverError,
    R Function(FetchRoomsFailureUnextistingUser)? unextistingUser,
    required R Function() orElse,
  }) {
    if (this is _FetchRoomsFailureServerError && serverError != null) {
      return serverError.call(this as _FetchRoomsFailureServerError);
    }

    if (this is _FetchRoomsFailureUnextistingUser && unextistingUser != null) {
      return unextistingUser.call(this as _FetchRoomsFailureUnextistingUser);
    }

    return orElse.call();
  }

  factory FetchRoomsFailure.fromString(String value) {
    if (value == 'serverError') {
      return FetchRoomsFailure.serverError();
    }

    if (value == 'unextistingUser') {
      return FetchRoomsFailure.unextistingUser();
    }

    return FetchRoomsFailure.serverError();
  }

  @override
  String toString() {
    if (this is _FetchRoomsFailureServerError) {
      return 'serverError';
    }

    if (this is _FetchRoomsFailureUnextistingUser) {
      return 'unextistingUser';
    }

    return 'serverError';
  }
}

class _FetchRoomsFailureServerError extends FetchRoomsFailure {
  const _FetchRoomsFailureServerError();
}

class _FetchRoomsFailureUnextistingUser extends FetchRoomsFailure {
  const _FetchRoomsFailureUnextistingUser();
}
