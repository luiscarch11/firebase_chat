typedef FetchRoomsFailureServerError = _FetchRoomsFailureServerError;

abstract class FetchRoomsFailure {
  const FetchRoomsFailure();
  factory FetchRoomsFailure.serverError() = _FetchRoomsFailureServerError;

  void when({
    required void Function(FetchRoomsFailureServerError) serverError,
  }) {
    if (this is _FetchRoomsFailureServerError) {
      return serverError.call(this as _FetchRoomsFailureServerError);
    }

    serverError.call(this as _FetchRoomsFailureServerError);
  }

  R map<R>({
    required R Function(FetchRoomsFailureServerError) serverError,
  }) {
    if (this is _FetchRoomsFailureServerError) {
      return serverError.call(this as _FetchRoomsFailureServerError);
    }

    return serverError.call(this as _FetchRoomsFailureServerError);
  }

  void maybeWhen({
    void Function(FetchRoomsFailureServerError)? serverError,
    required void Function() orElse,
  }) {
    if (this is _FetchRoomsFailureServerError && serverError != null) {
      return serverError.call(this as _FetchRoomsFailureServerError);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(FetchRoomsFailureServerError)? serverError,
    required R Function() orElse,
  }) {
    if (this is _FetchRoomsFailureServerError && serverError != null) {
      return serverError.call(this as _FetchRoomsFailureServerError);
    }

    return orElse.call();
  }

  factory FetchRoomsFailure.fromString(String value) {
    if (value == 'serverError') {
      return FetchRoomsFailure.serverError();
    }

    return FetchRoomsFailure.serverError();
  }

  @override
  String toString() {
    if (this is _FetchRoomsFailureServerError) {
      return 'serverError';
    }

    return 'serverError';
  }
}

class _FetchRoomsFailureServerError extends FetchRoomsFailure {}
