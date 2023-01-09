import 'person_middle_name/person_middle_name.dart';
import 'person_name_or_surname/person_name_or_surname.dart';

class PersonNameData {
  final PersonNameOrSurname name;
  final PersonNameOrSurname surname;
  final PersonMiddleName? middleName;
  const PersonNameData({
    required this.name,
    required this.surname,
    this.middleName,
  });
  bool contains(String text) {
    return name.getOrCrash().contains(text) ||
        surname.getOrCrash().contains(text) ||
        (middleName?.getOrCrash().contains(text) ?? false);
  }

  String get fullName {
    return '${name.getOrCrash()}${middleName == null ? ' ' : ' ${middleName!.getOrCrash()} '}${surname.getOrCrash()}';
  }

  PersonNameData copyWith({
    PersonNameOrSurname? name,
    PersonNameOrSurname? surname,
    PersonMiddleName? middleName,
  }) {
    return PersonNameData(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      middleName: middleName ?? this.middleName,
    );
  }

  @override
  String toString() => 'PersonNameData(name: $name, surname: $surname, middleName: $middleName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PersonNameData && other.name == name && other.surname == surname && other.middleName == middleName;
  }

  @override
  int get hashCode => name.hashCode ^ surname.hashCode ^ middleName.hashCode;
}
