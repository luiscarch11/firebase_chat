import '../core/failure.dart';

abstract class UrlFailure extends Failure {
  const UrlFailure();
  const factory UrlFailure.empty() = UrlFailureEmpty;
  const factory UrlFailure.invalid(String val) = UrlFailureInvalid;

  void when({
    required void Function(UrlFailureEmpty) empty,
    required void Function(UrlFailureInvalid) invalid,
  }) {
    if (this is UrlFailureEmpty) {
      return empty.call(this as UrlFailureEmpty);
    }

    if (this is UrlFailureInvalid) {
      return invalid.call(this as UrlFailureInvalid);
    }

    empty.call(this as UrlFailureEmpty);
  }

  R map<R>({
    required R Function(UrlFailureEmpty) empty,
    required R Function(UrlFailureInvalid) invalid,
  }) {
    if (this is UrlFailureEmpty) {
      return empty.call(this as UrlFailureEmpty);
    }

    if (this is UrlFailureInvalid) {
      return invalid.call(this as UrlFailureInvalid);
    }

    return empty.call(this as UrlFailureEmpty);
  }

  void maybeWhen({
    void Function(UrlFailureEmpty)? empty,
    void Function(UrlFailureInvalid)? invalid,
    required void Function() orElse,
  }) {
    if (this is UrlFailureEmpty && empty != null) {
      empty.call(this as UrlFailureEmpty);
    }

    if (this is UrlFailureInvalid && invalid != null) {
      invalid.call(this as UrlFailureInvalid);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(UrlFailureEmpty)? empty,
    R Function(UrlFailureInvalid)? invalid,
    required R Function() orElse,
  }) {
    if (this is UrlFailureEmpty && empty != null) {
      return empty.call(this as UrlFailureEmpty);
    }

    if (this is UrlFailureInvalid && invalid != null) {
      return invalid.call(this as UrlFailureInvalid);
    }

    return orElse.call();
  }

  @override
  String toString() {
    if (this is UrlFailureEmpty) {
      return 'empty';
    }

    if (this is UrlFailureInvalid) {
      return 'invalid';
    }

    return 'empty';
  }
}

class UrlFailureEmpty extends UrlFailure {
  const UrlFailureEmpty();
}

class UrlFailureInvalid extends UrlFailure {
  const UrlFailureInvalid(this.value);
  final String value;
}
