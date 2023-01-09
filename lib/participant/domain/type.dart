import 'package:firebase_chat/participant/domain/chat_participant.dart';

import '../../shared/domain/generic_name/generic_name.dart';
import '../../shared/domain/person_name_data.dart';

typedef ChatParticipantTypePerson = _ChatParticipantTypePerson;
typedef ChatParticipantTypeNonPerson = _ChatParticipantTypeNonPerson;

///[ChatParticipant] could be a person (with personal data) or a non-person
///(with non personal data).
abstract class ChatParticipantType {
  const ChatParticipantType();

  bool get isPerson => this is _ChatParticipantTypePerson;
  bool get isNotPerson => this is _ChatParticipantTypeNonPerson;

  const factory ChatParticipantType.person(PersonNameData data) = _ChatParticipantTypePerson;
  const factory ChatParticipantType.nonPerson(GenericName name) = _ChatParticipantTypeNonPerson;
  void when({
    required void Function(ChatParticipantTypePerson) person,
    required void Function(ChatParticipantTypeNonPerson) nonPerson,
  }) {
    if (this is ChatParticipantTypePerson) {
      return person.call(this as ChatParticipantTypePerson);
    }

    if (this is ChatParticipantTypeNonPerson) {
      return nonPerson.call(this as ChatParticipantTypeNonPerson);
    }

    person.call(this as ChatParticipantTypePerson);
  }

  R map<R>({
    required R Function(ChatParticipantTypePerson) person,
    required R Function(ChatParticipantTypeNonPerson) nonPerson,
  }) {
    if (this is ChatParticipantTypePerson) {
      return person.call(this as ChatParticipantTypePerson);
    }

    if (this is ChatParticipantTypeNonPerson) {
      return nonPerson.call(this as ChatParticipantTypeNonPerson);
    }

    return person.call(this as ChatParticipantTypePerson);
  }

  void maybeWhen({
    void Function(ChatParticipantTypePerson)? person,
    void Function(ChatParticipantTypeNonPerson)? nonPerson,
    required void Function() orElse,
  }) {
    if (this is ChatParticipantTypePerson && person != null) {
      return person.call(this as ChatParticipantTypePerson);
    }

    if (this is ChatParticipantTypeNonPerson && nonPerson != null) {
      return nonPerson.call(this as ChatParticipantTypeNonPerson);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(ChatParticipantTypePerson)? person,
    R Function(ChatParticipantTypeNonPerson)? nonPerson,
    required R Function() orElse,
  }) {
    if (this is ChatParticipantTypePerson && person != null) {
      return person.call(this as ChatParticipantTypePerson);
    }

    if (this is ChatParticipantTypeNonPerson && nonPerson != null) {
      return nonPerson.call(this as ChatParticipantTypeNonPerson);
    }

    return orElse.call();
  }

  @override
  String toString() {
    if (this is ChatParticipantTypePerson) {
      return 'person';
    }

    if (this is ChatParticipantTypeNonPerson) {
      return 'nonPerson';
    }

    return 'person';
  }
}

class _ChatParticipantTypePerson extends ChatParticipantType {
  final PersonNameData data;

  const _ChatParticipantTypePerson(this.data);
}

class _ChatParticipantTypeNonPerson extends ChatParticipantType {
  final GenericName name;

  const _ChatParticipantTypeNonPerson(this.name);
}
