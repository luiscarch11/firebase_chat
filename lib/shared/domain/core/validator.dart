import 'package:firebase_chat/shared/domain/iterable_extension.dart';
import 'package:flutter/foundation.dart';

import 'either.dart';
import 'rule.dart';

abstract class Validator<F, T> {
  Validator(this.value, {required this.rules});

  final T value;
  final List<Rule<F, dynamic>> rules;

  Rule<F, dynamic>? get invalidRule => rules.firstWhereOrNull(
        (rule) => !(rule.isValid),
      );

  bool get isValid => !rules.any((rule) => !(rule.isValid));

  @protected
  void validate() {
    _rulesValidator.call();
  }

  Either<F, T> get valueAfterValidation {
    if (_error != null) return left(_error as F);
    return right(value);
  }

  void _rulesValidator() {
    var validRules = 0;
    for (var rule in rules) {
      rule.validate();

      if (!rule.isValid) {
        _error = rule.failure;
        return;
      }
      validRules++;
    }
    if (validRules == rules.length) _error = null;
  }

  F? _error;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Validator<F, T> && other.value == value && listEquals(other.rules, rules);
  }

  @override
  int get hashCode => value.hashCode ^ rules.hashCode;
}
