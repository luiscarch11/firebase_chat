import 'package:flutter/foundation.dart';

import 'package:firebase_chat/participant/domain/chat_participant.dart';
import 'package:firebase_chat/shared/domain/message/chat_message.dart';
import 'package:firebase_chat/shared/domain/unique_id/unique_id.dart';

//Represents a conversation between different parties (represented by the [ChatParticipant] class)
class ChatRoom {
  final UniqueId id;

  ///Parties involved in the conversation
  final List<ChatParticipant> participants;

  ///Information about the last message sent to the [ChatRoom]. If no
  ///message has been sent yet, its value will be null.
  final ChatMessage? lastMessage;
  ChatRoom({
    required this.id,
    required this.participants,
    this.lastMessage,
  });

  ChatRoom copyWith({
    UniqueId? id,
    List<ChatParticipant>? participants,
    ChatMessage? lastMessage,
  }) {
    return ChatRoom(
      id: id ?? this.id,
      participants: participants ?? this.participants,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  @override
  String toString() => 'ChatRoom(id: $id, participants: $participants, lastMessage: $lastMessage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatRoom &&
        other.id == id &&
        listEquals(other.participants, participants) &&
        other.lastMessage == lastMessage;
  }

  @override
  int get hashCode => id.hashCode ^ participants.hashCode ^ lastMessage.hashCode;
}
