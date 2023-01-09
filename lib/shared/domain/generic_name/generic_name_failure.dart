import '../core/failure.dart';

typedef GenericNameFailureTooLong = _GenericNameFailureTooLong;

abstract class GenericNameFailure extends Failure {
  const GenericNameFailure();
  const factory GenericNameFailure.invalidLength(String value) = _GenericNameFailureTooLong;

  void when({
    required void Function(GenericNameFailureTooLong) invalidLength,
  }) {
    if (this is _GenericNameFailureTooLong) {
      return invalidLength.call(this as _GenericNameFailureTooLong);
    }

    invalidLength.call(this as _GenericNameFailureTooLong);
  }

  R map<R>({
    required R Function(GenericNameFailureTooLong) invalidLength,
  }) {
    if (this is _GenericNameFailureTooLong) {
      return invalidLength.call(this as _GenericNameFailureTooLong);
    }

    return invalidLength.call(this as _GenericNameFailureTooLong);
  }

  void maybeWhen({
    void Function(GenericNameFailureTooLong)? invalidLength,
    required void Function() orElse,
  }) {
    if (this is _GenericNameFailureTooLong && invalidLength != null) {
      return invalidLength.call(this as _GenericNameFailureTooLong);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(GenericNameFailureTooLong)? invalidLength,
    required R Function() orElse,
  }) {
    if (this is _GenericNameFailureTooLong && invalidLength != null) {
      return invalidLength.call(this as _GenericNameFailureTooLong);
    }

    return orElse.call();
  }

  @override
  String toString() {
    if (this is _GenericNameFailureTooLong) {
      return 'invalidLength';
    }

    return 'invalidLength';
  }
}

class _GenericNameFailureTooLong extends GenericNameFailure {
  final String value;

  const _GenericNameFailureTooLong(this.value);
}
