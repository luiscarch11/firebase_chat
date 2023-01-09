import '../core/failure.dart';

abstract class PersonMiddleNameFailure extends Failure {
  const PersonMiddleNameFailure();
  const factory PersonMiddleNameFailure.empty() = NameFailureEmpty;
  const factory PersonMiddleNameFailure.invalid() = NameFailureInvalid;
  const factory PersonMiddleNameFailure.wrongLength(String value) = NameFailureWrongLength;

  void when({
    required void Function(NameFailureEmpty) empty,
    required void Function(NameFailureInvalid) invalid,
    required void Function(NameFailureWrongLength) wrongLength,
  }) {
    if (this is NameFailureEmpty) {
      empty.call(this as NameFailureEmpty);
    }

    if (this is NameFailureInvalid) {
      invalid.call(this as NameFailureInvalid);
    }

    if (this is NameFailureWrongLength) {
      wrongLength.call(this as NameFailureWrongLength);
    }

    empty.call(this as NameFailureEmpty);
  }

  R map<R>({
    required R Function(NameFailureEmpty) empty,
    required R Function(NameFailureInvalid) invalid,
    required R Function(NameFailureWrongLength) wrongLength,
  }) {
    if (this is NameFailureEmpty) {
      return empty.call(this as NameFailureEmpty);
    }

    if (this is NameFailureInvalid) {
      return invalid.call(this as NameFailureInvalid);
    }

    if (this is NameFailureWrongLength) {
      return wrongLength.call(this as NameFailureWrongLength);
    }

    return empty.call(this as NameFailureEmpty);
  }

  void maybeWhen({
    void Function(NameFailureEmpty)? empty,
    void Function(NameFailureInvalid)? invalid,
    void Function(NameFailureWrongLength)? wrongLength,
    required void Function() orElse,
  }) {
    if (this is NameFailureEmpty && empty != null) {
      empty.call(this as NameFailureEmpty);
    }

    if (this is NameFailureInvalid && invalid != null) {
      invalid.call(this as NameFailureInvalid);
    }

    if (this is NameFailureWrongLength && wrongLength != null) {
      wrongLength.call(this as NameFailureWrongLength);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(NameFailureEmpty)? empty,
    R Function(NameFailureInvalid)? invalid,
    R Function(NameFailureWrongLength)? wrongLength,
    required R Function() orElse,
  }) {
    if (this is NameFailureEmpty && empty != null) {
      return empty.call(this as NameFailureEmpty);
    }

    if (this is NameFailureInvalid && invalid != null) {
      return invalid.call(this as NameFailureInvalid);
    }

    if (this is NameFailureWrongLength && wrongLength != null) {
      return wrongLength.call(this as NameFailureWrongLength);
    }

    return orElse.call();
  }

  factory PersonMiddleNameFailure.fromString(String value) {
    if (value == 'empty') {
      return const PersonMiddleNameFailure.empty();
    }

    if (value == 'invalid') {
      return const PersonMiddleNameFailure.invalid();
    }

    return const PersonMiddleNameFailure.empty();
  }

  @override
  String toString() {
    if (this is NameFailureEmpty) {
      return 'empty';
    }

    if (this is NameFailureInvalid) {
      return 'invalid';
    }

    if (this is NameFailureWrongLength) {
      return 'wrongLength';
    }

    return 'empty';
  }
}

class NameFailureEmpty extends PersonMiddleNameFailure {
  const NameFailureEmpty();
}

class NameFailureInvalid extends PersonMiddleNameFailure {
  const NameFailureInvalid();
}

class NameFailureWrongLength extends PersonMiddleNameFailure {
  final String value;

  const NameFailureWrongLength(this.value);
}
