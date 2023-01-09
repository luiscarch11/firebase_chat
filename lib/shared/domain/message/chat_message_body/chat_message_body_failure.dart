typedef ChatMessageBodyFailureEmpty = _ChatMessageBodyFailureEmpty;
typedef ChatMessageBodyFailureTooLong = _ChatMessageBodyFailureTooLong;

abstract class ChatMessageBodyFailure {
  const ChatMessageBodyFailure();
  const factory ChatMessageBodyFailure.empty() = _ChatMessageBodyFailureEmpty;
  const factory ChatMessageBodyFailure.tooLong() = _ChatMessageBodyFailureTooLong;

  void when({
    required void Function(ChatMessageBodyFailureEmpty) empty,
    required void Function(ChatMessageBodyFailureTooLong) tooLong,
  }) {
    if (this is _ChatMessageBodyFailureEmpty) {
      return empty.call(this as _ChatMessageBodyFailureEmpty);
    }

    if (this is _ChatMessageBodyFailureTooLong) {
      return tooLong.call(this as _ChatMessageBodyFailureTooLong);
    }

    empty.call(this as _ChatMessageBodyFailureEmpty);
  }

  R map<R>({
    required R Function(ChatMessageBodyFailureEmpty) empty,
    required R Function(ChatMessageBodyFailureTooLong) tooLong,
  }) {
    if (this is _ChatMessageBodyFailureEmpty) {
      return empty.call(this as _ChatMessageBodyFailureEmpty);
    }

    if (this is _ChatMessageBodyFailureTooLong) {
      return tooLong.call(this as _ChatMessageBodyFailureTooLong);
    }

    return empty.call(this as _ChatMessageBodyFailureEmpty);
  }

  void maybeWhen({
    void Function(ChatMessageBodyFailureEmpty)? empty,
    void Function(ChatMessageBodyFailureTooLong)? tooLong,
    required void Function() orElse,
  }) {
    if (this is _ChatMessageBodyFailureEmpty && empty != null) {
      return empty.call(this as _ChatMessageBodyFailureEmpty);
    }

    if (this is _ChatMessageBodyFailureTooLong && tooLong != null) {
      return tooLong.call(this as _ChatMessageBodyFailureTooLong);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(ChatMessageBodyFailureEmpty)? empty,
    R Function(ChatMessageBodyFailureTooLong)? tooLong,
    required R Function() orElse,
  }) {
    if (this is _ChatMessageBodyFailureEmpty && empty != null) {
      return empty.call(this as _ChatMessageBodyFailureEmpty);
    }

    if (this is _ChatMessageBodyFailureTooLong && tooLong != null) {
      return tooLong.call(this as _ChatMessageBodyFailureTooLong);
    }

    return orElse.call();
  }

  factory ChatMessageBodyFailure.fromString(String value) {
    if (value == 'empty') {
      return const ChatMessageBodyFailure.empty();
    }

    if (value == 'tooLong') {
      return const ChatMessageBodyFailure.tooLong();
    }

    return const ChatMessageBodyFailure.empty();
  }

  @override
  String toString() {
    if (this is _ChatMessageBodyFailureEmpty) {
      return 'empty';
    }

    if (this is _ChatMessageBodyFailureTooLong) {
      return 'tooLong';
    }

    return 'empty';
  }
}

class _ChatMessageBodyFailureEmpty extends ChatMessageBodyFailure {
  const _ChatMessageBodyFailureEmpty();
}

class _ChatMessageBodyFailureTooLong extends ChatMessageBodyFailure {
  const _ChatMessageBodyFailureTooLong();
}
