import '../core/failure.dart';

abstract class UniqueIdFailure extends Failure {
  const UniqueIdFailure();
  const factory UniqueIdFailure.invalid() = UniqueIdFailureInvalid;
  const factory UniqueIdFailure.empty() = UniqueIdFailureEmpty;

  void when({
    required void Function(UniqueIdFailureInvalid) invalid,
    required void Function(UniqueIdFailureEmpty) empty,
  }) {
    if (this is UniqueIdFailureInvalid) {
      invalid.call(this as UniqueIdFailureInvalid);
    }

    if (this is UniqueIdFailureEmpty) {
      empty.call(this as UniqueIdFailureEmpty);
    }

    invalid.call(this as UniqueIdFailureInvalid);
  }

  R map<R>({
    required R Function(UniqueIdFailureInvalid) invalid,
    required R Function(UniqueIdFailureEmpty) empty,
  }) {
    if (this is UniqueIdFailureInvalid) {
      return invalid.call(this as UniqueIdFailureInvalid);
    }

    if (this is UniqueIdFailureEmpty) {
      return empty.call(this as UniqueIdFailureEmpty);
    }

    return invalid.call(this as UniqueIdFailureInvalid);
  }

  void maybeWhen({
    void Function(UniqueIdFailureInvalid)? invalid,
    void Function(UniqueIdFailureEmpty)? empty,
    required void Function() orElse,
  }) {
    if (this is UniqueIdFailureInvalid && invalid != null) {
      invalid.call(this as UniqueIdFailureInvalid);
    }

    if (this is UniqueIdFailureEmpty && empty != null) {
      empty.call(this as UniqueIdFailureEmpty);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(UniqueIdFailureInvalid)? invalid,
    R Function(UniqueIdFailureEmpty)? empty,
    required R Function() orElse,
  }) {
    if (this is UniqueIdFailureInvalid && invalid != null) {
      return invalid.call(this as UniqueIdFailureInvalid);
    }

    if (this is UniqueIdFailureEmpty && empty != null) {
      return empty.call(this as UniqueIdFailureEmpty);
    }

    return orElse.call();
  }

  factory UniqueIdFailure.fromString(String value) {
    if (value == 'invalid') {
      return const UniqueIdFailure.invalid();
    }

    if (value == 'empty') {
      return const UniqueIdFailure.empty();
    }

    return const UniqueIdFailure.invalid();
  }

  @override
  String toString() {
    if (this is UniqueIdFailureInvalid) {
      return 'invalid';
    }

    if (this is UniqueIdFailureEmpty) {
      return 'empty';
    }

    return 'invalid';
  }
}

class UniqueIdFailureInvalid extends UniqueIdFailure {
  const UniqueIdFailureInvalid();
}

class UniqueIdFailureEmpty extends UniqueIdFailure {
  const UniqueIdFailureEmpty();
}
