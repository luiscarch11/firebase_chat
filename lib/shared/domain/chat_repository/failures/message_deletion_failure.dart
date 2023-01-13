typedef MessageDeletionFailureServerError = _MessageDeletionFailureServerError;
typedef MessageDeletionFailureMessageDoesntExist = _MessageDeletionFailureMessageDoesntExist;
typedef MessageDeletionFailureMessageAlreadyDeleted = _MessageDeletionFailureMessageAlreadyDeleted;

abstract class MessageDeletionFailure {
  const MessageDeletionFailure();
  const factory MessageDeletionFailure.serverError() = _MessageDeletionFailureServerError;
  const factory MessageDeletionFailure.sessageDoesntExist() = _MessageDeletionFailureMessageDoesntExist;
  const factory MessageDeletionFailure.messageAlreadyDeleted() = _MessageDeletionFailureMessageAlreadyDeleted;

  void when({
    required void Function(MessageDeletionFailureServerError) serverError,
    required void Function(MessageDeletionFailureMessageDoesntExist) sessageDoesntExist,
    required void Function(MessageDeletionFailureMessageAlreadyDeleted) messageAlreadyDeleted,
  }) {
    if (this is _MessageDeletionFailureServerError) {
      return serverError.call(this as _MessageDeletionFailureServerError);
    }

    if (this is _MessageDeletionFailureMessageDoesntExist) {
      return sessageDoesntExist.call(this as _MessageDeletionFailureMessageDoesntExist);
    }

    if (this is _MessageDeletionFailureMessageAlreadyDeleted) {
      return messageAlreadyDeleted.call(this as _MessageDeletionFailureMessageAlreadyDeleted);
    }

    serverError.call(this as _MessageDeletionFailureServerError);
  }

  R map<R>({
    required R Function(MessageDeletionFailureServerError) serverError,
    required R Function(MessageDeletionFailureMessageDoesntExist) sessageDoesntExist,
    required R Function(MessageDeletionFailureMessageAlreadyDeleted) messageAlreadyDeleted,
  }) {
    if (this is _MessageDeletionFailureServerError) {
      return serverError.call(this as _MessageDeletionFailureServerError);
    }

    if (this is _MessageDeletionFailureMessageDoesntExist) {
      return sessageDoesntExist.call(this as _MessageDeletionFailureMessageDoesntExist);
    }

    if (this is _MessageDeletionFailureMessageAlreadyDeleted) {
      return messageAlreadyDeleted.call(this as _MessageDeletionFailureMessageAlreadyDeleted);
    }

    return serverError.call(this as _MessageDeletionFailureServerError);
  }

  void maybeWhen({
    void Function(MessageDeletionFailureServerError)? serverError,
    void Function(MessageDeletionFailureMessageDoesntExist)? sessageDoesntExist,
    void Function(MessageDeletionFailureMessageAlreadyDeleted)? messageAlreadyDeleted,
    required void Function() orElse,
  }) {
    if (this is _MessageDeletionFailureServerError && serverError != null) {
      return serverError.call(this as _MessageDeletionFailureServerError);
    }

    if (this is _MessageDeletionFailureMessageDoesntExist && sessageDoesntExist != null) {
      return sessageDoesntExist.call(this as _MessageDeletionFailureMessageDoesntExist);
    }

    if (this is _MessageDeletionFailureMessageAlreadyDeleted && messageAlreadyDeleted != null) {
      return messageAlreadyDeleted.call(this as _MessageDeletionFailureMessageAlreadyDeleted);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(MessageDeletionFailureServerError)? serverError,
    R Function(MessageDeletionFailureMessageDoesntExist)? sessageDoesntExist,
    R Function(MessageDeletionFailureMessageAlreadyDeleted)? messageAlreadyDeleted,
    required R Function() orElse,
  }) {
    if (this is _MessageDeletionFailureServerError && serverError != null) {
      return serverError.call(this as _MessageDeletionFailureServerError);
    }

    if (this is _MessageDeletionFailureMessageDoesntExist && sessageDoesntExist != null) {
      return sessageDoesntExist.call(this as _MessageDeletionFailureMessageDoesntExist);
    }

    if (this is _MessageDeletionFailureMessageAlreadyDeleted && messageAlreadyDeleted != null) {
      return messageAlreadyDeleted.call(this as _MessageDeletionFailureMessageAlreadyDeleted);
    }

    return orElse.call();
  }

  factory MessageDeletionFailure.fromString(String value) {
    if (value == 'serverError') {
      return const MessageDeletionFailure.serverError();
    }

    if (value == 'sessageDoesntExist') {
      return const MessageDeletionFailure.sessageDoesntExist();
    }

    if (value == 'messageAlreadyDeleted') {
      return const MessageDeletionFailure.messageAlreadyDeleted();
    }

    return const MessageDeletionFailure.serverError();
  }

  @override
  String toString() {
    if (this is _MessageDeletionFailureServerError) {
      return 'serverError';
    }

    if (this is _MessageDeletionFailureMessageDoesntExist) {
      return 'sessageDoesntExist';
    }

    if (this is _MessageDeletionFailureMessageAlreadyDeleted) {
      return 'messageAlreadyDeleted';
    }

    return 'serverError';
  }
}

class _MessageDeletionFailureServerError extends MessageDeletionFailure {
  const _MessageDeletionFailureServerError();
}

class _MessageDeletionFailureMessageDoesntExist extends MessageDeletionFailure {
  const _MessageDeletionFailureMessageDoesntExist();
}

class _MessageDeletionFailureMessageAlreadyDeleted extends MessageDeletionFailure {
  const _MessageDeletionFailureMessageAlreadyDeleted();
}
