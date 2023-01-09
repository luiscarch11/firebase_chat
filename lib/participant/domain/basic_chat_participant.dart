import 'package:firebase_chat/participant/domain/chat_participant.dart';
import 'package:firebase_chat/room/domain/room.dart';

import '../../shared/domain/url/url.dart';
import 'type.dart';

///Basic data for [ChatParticipant]
class BasicChatParticipant {
  ///Basic data for [ChatParticipant]
  final ChatParticipantType type;

  ///URL of the [ChatParticipant]'s photo (it will be used to represent them
  ///in the [ChatRoom] when their messages are showed up).
  ///Defaults to null if no URL is provided
  final Url? photoUrl;
  BasicChatParticipant({
    required this.type,
    this.photoUrl,
  });

  BasicChatParticipant copyWith({
    ChatParticipantType? type,
    Url? photoUrl,
  }) {
    return BasicChatParticipant(
      type: type ?? this.type,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  String toString() => 'BasicChatParticipant(type: $type, photoUrl: $photoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BasicChatParticipant && other.type == type && other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => type.hashCode ^ photoUrl.hashCode;
}
