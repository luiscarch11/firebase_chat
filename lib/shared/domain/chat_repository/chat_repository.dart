import 'package:firebase_chat/participant/domain/basic_chat_participant.dart';
import 'package:firebase_chat/room/domain/room.dart';
import 'package:firebase_chat/shared/domain/chat_repository/room_creation_failure.dart';
import 'package:firebase_chat/shared/domain/core/core.dart';

abstract class ChatRepository {
  Future<Resource<RoomCreationFailure, ChatRoom>> lazyCreateRoom(
    Set<BasicChatParticipant> chatParticipants,
  );
  Future<Resource<RoomCreationFailure, ChatRoom>> createRoom(
    Set<BasicChatParticipant> chatParticipants,
  );
}
