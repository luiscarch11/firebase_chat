typedef ResourceFailure<F, T> = _ResourceFailure<F, T>;
typedef ResourceSuccess<F, T> = _ResourceSuccess<F, T>;

abstract class Resource<F, T> {
  const Resource();
  factory Resource.none() = _ResourceNone;
  factory Resource.loading() = _ResourceLoading;
  factory Resource.success(T resource) = _ResourceSuccess;
  factory Resource.failure(F failure) = _ResourceFailure;
  T get successResource => (this as _ResourceSuccess<F, T>).value;
  F get failureResource => (this as _ResourceFailure<F, T>).failure;

  bool get isNone => this is _ResourceNone;
  bool get isLoading => this is _ResourceLoading;
  bool get isSuccess => this is _ResourceSuccess;
  bool get isFailure => this is _ResourceFailure;

  void whenIsFailure(void Function(F failure) isFailure) {
    if (this is _ResourceFailure) {
      isFailure.call((this as _ResourceFailure).failure as F);
    }
  }

  void whenIsSuccess(void Function(T resource) isSuccess) {
    if (this is _ResourceSuccess) {
      isSuccess.call((this as _ResourceSuccess).value as T);
    }
  }

  void when({
    required void Function() isNone,
    required void Function() isLoading,
    required void Function(T resource) isSuccess,
    required void Function(F failure) isFailure,
  }) {
    if (this is _ResourceNone) {
      return isNone.call();
    }

    if (this is _ResourceLoading) {
      return isLoading.call();
    }

    if (this is _ResourceSuccess) {
      return isSuccess.call((this as _ResourceSuccess).value as T);
    }

    if (this is _ResourceFailure) {
      return isFailure.call((this as _ResourceFailure).failure as F);
    }
  }

  R map<R>({
    required R Function() isNone,
    required R Function() isLoading,
    required R Function(T resource) isSuccess,
    required R Function(F failure) isFailure,
  }) {
    if (this is _ResourceNone) {
      return isNone.call();
    }

    if (this is _ResourceLoading) {
      return isLoading.call();
    }

    if (this is _ResourceSuccess) {
      return isSuccess.call((this as _ResourceSuccess).value as T);
    }

    if (this is _ResourceFailure) {
      return isFailure.call((this as _ResourceFailure).failure as F);
    }

    return isNone.call();
  }

  void maybeWhen({
    void Function()? isNone,
    void Function()? isLoading,
    void Function(T resource)? isSuccess,
    void Function(F failure)? isFailure,
    required void Function() orElse,
  }) {
    if (this is _ResourceNone && isNone != null) {
      return isNone.call();
    }

    if (this is _ResourceLoading && isLoading != null) {
      return isLoading.call();
    }

    if (this is _ResourceSuccess && isSuccess != null) {
      isSuccess.call((this as _ResourceSuccess).value as T);
      return;
    }

    if (this is _ResourceFailure && isFailure != null) {
      return isFailure.call((this as _ResourceFailure).failure as F);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function()? isNone,
    R Function()? isLoading,
    R Function(T resource)? isSuccess,
    R Function(F failure)? isFailure,
    required R Function() orElse,
  }) {
    if (this is _ResourceNone && isNone != null) {
      return isNone.call();
    }

    if (this is _ResourceLoading && isLoading != null) {
      return isLoading.call();
    }

    if (this is _ResourceSuccess && isSuccess != null) {
      return isSuccess.call((this as _ResourceSuccess).value as T);
    }

    if (this is _ResourceFailure && isFailure != null) {
      return isFailure.call((this as _ResourceFailure).failure as F);
    }

    return orElse.call();
  }
}

class _ResourceNone<F, T> extends Resource<F, T> {}

class _ResourceLoading<F, T> extends Resource<F, T> {}

class _ResourceSuccess<F, T> extends Resource<F, T> {
  final T value;

  _ResourceSuccess(this.value);
}

class _ResourceFailure<F, T> extends Resource<F, T> {
  final F failure;

  _ResourceFailure(this.failure);
}
