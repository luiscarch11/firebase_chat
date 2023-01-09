class Failure {
  const Failure([this.val]);
  final String? val;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.val == val;
  }

  @override
  int get hashCode => val.hashCode;
}
