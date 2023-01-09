class Option<T> {
  Option._();

  bool get isNone => this is _None;
  bool get isSome => this is _Some;
  P fold<P>(
    P Function() isNone,
    P Function(T value) isSome,
  ) {
    if (this.isNone) {
      return isNone();
    }
    return isSome((this as _Some<T>).value);
  }
}

Option<T> some<T>(T value) => _Some(value);
Option<T> none<T>() => _None();

class _Some<T> extends Option<T> {
  _Some(
    this.value,
  ) : super._();
  final T value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _Some<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class _None<T> extends Option<T> {
  _None() : super._();
}
