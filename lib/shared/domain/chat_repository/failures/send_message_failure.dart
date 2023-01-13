typedef SendMessageFailureServerError = _SendMessageFailureServerError;
typedef SendMessageFailureNoRoomSelected = _SendMessageFailureNoRoomSelected;

abstract class SendMessageFailure {
  const SendMessageFailure();
  const factory SendMessageFailure.serverError() = _SendMessageFailureServerError;
  const factory SendMessageFailure.noRoomSelected() = _SendMessageFailureNoRoomSelected;

  void when({
    required void Function(SendMessageFailureServerError) serverError,
    required void Function(SendMessageFailureNoRoomSelected) noRoomSelected,
  }) {
    if (this is _SendMessageFailureServerError) {
      return serverError.call(this as _SendMessageFailureServerError);
    }

    if (this is _SendMessageFailureNoRoomSelected) {
      return noRoomSelected.call(this as _SendMessageFailureNoRoomSelected);
    }

    serverError.call(this as _SendMessageFailureServerError);
  }

  R map<R>({
    required R Function(SendMessageFailureServerError) serverError,
    required R Function(SendMessageFailureNoRoomSelected) noRoomSelected,
  }) {
    if (this is _SendMessageFailureServerError) {
      return serverError.call(this as _SendMessageFailureServerError);
    }

    if (this is _SendMessageFailureNoRoomSelected) {
      return noRoomSelected.call(this as _SendMessageFailureNoRoomSelected);
    }

    return serverError.call(this as _SendMessageFailureServerError);
  }

  void maybeWhen({
    void Function(SendMessageFailureServerError)? serverError,
    void Function(SendMessageFailureNoRoomSelected)? noRoomSelected,
    required void Function() orElse,
  }) {
    if (this is _SendMessageFailureServerError && serverError != null) {
      return serverError.call(this as _SendMessageFailureServerError);
    }

    if (this is _SendMessageFailureNoRoomSelected && noRoomSelected != null) {
      return noRoomSelected.call(this as _SendMessageFailureNoRoomSelected);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(SendMessageFailureServerError)? serverError,
    R Function(SendMessageFailureNoRoomSelected)? noRoomSelected,
    required R Function() orElse,
  }) {
    if (this is _SendMessageFailureServerError && serverError != null) {
      return serverError.call(this as _SendMessageFailureServerError);
    }

    if (this is _SendMessageFailureNoRoomSelected && noRoomSelected != null) {
      return noRoomSelected.call(this as _SendMessageFailureNoRoomSelected);
    }

    return orElse.call();
  }

  factory SendMessageFailure.fromString(String value) {
    if (value == 'serverError') {
      return const SendMessageFailure.serverError();
    }

    if (value == 'noRoomSelected') {
      return const SendMessageFailure.noRoomSelected();
    }

    return const SendMessageFailure.serverError();
  }

  @override
  String toString() {
    if (this is _SendMessageFailureServerError) {
      return 'serverError';
    }

    if (this is _SendMessageFailureNoRoomSelected) {
      return 'noRoomSelected';
    }

    return 'serverError';
  }
}

class _SendMessageFailureServerError extends SendMessageFailure {
  const _SendMessageFailureServerError();
}

class _SendMessageFailureNoRoomSelected extends SendMessageFailure {
  const _SendMessageFailureNoRoomSelected();
}
