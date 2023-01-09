import '../../../participant/domain/chat_participant_failure.dart';

typedef RoomCreationFailureInvalidChatParticipant = _RoomCreationFailureInvalidChatParticipant;

abstract class RoomCreationFailure {
  const RoomCreationFailure();
  const factory RoomCreationFailure.invalidChatParticipant(ChatParticipantFailure failure) =
      _RoomCreationFailureInvalidChatParticipant;

  void when({
    required void Function(RoomCreationFailureInvalidChatParticipant) invalidChatParticipant,
  }) {
    if (this is _RoomCreationFailureInvalidChatParticipant) {
      return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
    }

    invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
  }

  R map<R>({
    required R Function(RoomCreationFailureInvalidChatParticipant) invalidChatParticipant,
  }) {
    if (this is _RoomCreationFailureInvalidChatParticipant) {
      return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
    }

    return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
  }

  void maybeWhen({
    void Function(RoomCreationFailureInvalidChatParticipant)? invalidChatParticipant,
    required void Function() orElse,
  }) {
    if (this is _RoomCreationFailureInvalidChatParticipant && invalidChatParticipant != null) {
      return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(RoomCreationFailureInvalidChatParticipant)? invalidChatParticipant,
    required R Function() orElse,
  }) {
    if (this is _RoomCreationFailureInvalidChatParticipant && invalidChatParticipant != null) {
      return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
    }

    return orElse.call();
  }

  @override
  String toString() {
    if (this is _RoomCreationFailureInvalidChatParticipant) {
      return 'invalidChatParticipant';
    }

    return 'invalidChatParticipant';
  }
}

class _RoomCreationFailureInvalidChatParticipant extends RoomCreationFailure {
  final ChatParticipantFailure failure;

  const _RoomCreationFailureInvalidChatParticipant(this.failure);
}
