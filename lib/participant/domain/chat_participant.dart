import 'package:firebase_chat/participant/domain/basic_chat_participant.dart';
import 'package:firebase_chat/room/domain/room.dart';

import '../../shared/domain/unique_id/unique_id.dart';

///Represents one of the members of the [ChatRoom]
class ChatParticipant {
  final UniqueId id;

  ///The basic data for the participant
  final BasicChatParticipant participant;

  ///Last time the participant checked their chat rooms List
  final DateTime? lastConnectedAt;
  ChatParticipant({
    required this.id,
    required this.participant,
    this.lastConnectedAt,
  });

  ChatParticipant copyWith({
    UniqueId? id,
    BasicChatParticipant? participant,
    DateTime? lastConnectedAt,
  }) {
    return ChatParticipant(
      id: id ?? this.id,
      participant: participant ?? this.participant,
      lastConnectedAt: lastConnectedAt ?? this.lastConnectedAt,
    );
  }

  @override
  String toString() => 'ChatParticipant(id: $id, participant: $participant, lastConnectedAt: $lastConnectedAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatParticipant &&
        other.id == id &&
        other.participant == participant &&
        other.lastConnectedAt == lastConnectedAt;
  }

  @override
  int get hashCode => id.hashCode ^ participant.hashCode ^ lastConnectedAt.hashCode;
}
