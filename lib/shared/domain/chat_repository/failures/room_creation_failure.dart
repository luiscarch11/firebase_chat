import '../../../../participant/domain/chat_participant_failure.dart';

typedef RoomCreationFailureInvalidChatParticipant = _RoomCreationFailureInvalidChatParticipant;
typedef RoomCreationFailureRoomAlreadyExists = _RoomCreationFailureRoomAlreadyExists;

abstract class RoomCreationFailure {
  const RoomCreationFailure();
  factory RoomCreationFailure.invalidChatParticipant(ChatParticipantFailure failure) =
      _RoomCreationFailureInvalidChatParticipant;
  factory RoomCreationFailure.roomAlreadyExists() = _RoomCreationFailureRoomAlreadyExists;

  void when({
    required void Function(RoomCreationFailureInvalidChatParticipant) invalidChatParticipant,
    required void Function(RoomCreationFailureRoomAlreadyExists) roomAlreadyExists,
  }) {
    if (this is _RoomCreationFailureInvalidChatParticipant) {
      return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
    }

    if (this is _RoomCreationFailureRoomAlreadyExists) {
      return roomAlreadyExists.call(this as _RoomCreationFailureRoomAlreadyExists);
    }

    invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
  }

  R map<R>({
    required R Function(RoomCreationFailureInvalidChatParticipant) invalidChatParticipant,
    required R Function(RoomCreationFailureRoomAlreadyExists) roomAlreadyExists,
  }) {
    if (this is _RoomCreationFailureInvalidChatParticipant) {
      return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
    }

    if (this is _RoomCreationFailureRoomAlreadyExists) {
      return roomAlreadyExists.call(this as _RoomCreationFailureRoomAlreadyExists);
    }

    return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
  }

  void maybeWhen({
    void Function(RoomCreationFailureInvalidChatParticipant)? invalidChatParticipant,
    void Function(RoomCreationFailureRoomAlreadyExists)? roomAlreadyExists,
    required void Function() orElse,
  }) {
    if (this is _RoomCreationFailureInvalidChatParticipant && invalidChatParticipant != null) {
      return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
    }

    if (this is _RoomCreationFailureRoomAlreadyExists && roomAlreadyExists != null) {
      return roomAlreadyExists.call(this as _RoomCreationFailureRoomAlreadyExists);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(RoomCreationFailureInvalidChatParticipant)? invalidChatParticipant,
    R Function(RoomCreationFailureRoomAlreadyExists)? roomAlreadyExists,
    required R Function() orElse,
  }) {
    if (this is _RoomCreationFailureInvalidChatParticipant && invalidChatParticipant != null) {
      return invalidChatParticipant.call(this as _RoomCreationFailureInvalidChatParticipant);
    }

    if (this is _RoomCreationFailureRoomAlreadyExists && roomAlreadyExists != null) {
      return roomAlreadyExists.call(this as _RoomCreationFailureRoomAlreadyExists);
    }

    return orElse.call();
  }

  @override
  String toString() {
    if (this is _RoomCreationFailureInvalidChatParticipant) {
      return 'invalidChatParticipant';
    }

    if (this is _RoomCreationFailureRoomAlreadyExists) {
      return 'roomAlreadyExists';
    }

    return 'invalidChatParticipant';
  }
}

class _RoomCreationFailureInvalidChatParticipant extends RoomCreationFailure {
  final ChatParticipantFailure failure;

  _RoomCreationFailureInvalidChatParticipant(this.failure);
}

class _RoomCreationFailureRoomAlreadyExists extends RoomCreationFailure {}
