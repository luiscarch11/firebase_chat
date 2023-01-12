import 'package:firebase_chat/participant/domain/basic_chat_participant.dart';
import 'package:firebase_chat/room/domain/room.dart';
import 'package:firebase_chat/shared/domain/chat_repository/fetch_rooms_failure.dart';
import 'package:firebase_chat/shared/domain/chat_repository/room_creation_failure.dart';
import 'package:firebase_chat/shared/domain/core/core.dart';
import 'package:firebase_chat/shared/domain/unique_id/unique_id.dart';

abstract class ChatRepository {
  Future<Resource<RoomCreationFailure, ChatRoom>> lazyCreateRoom(
    Set<BasicChatParticipant> chatParticipants,
  );
  Future<Resource<RoomCreationFailure, ChatRoom>> createRoom(
    Set<BasicChatParticipant> chatParticipants,
  );
  Stream<Resource<FetchRoomsFailure, List<ChatRoom>>> fetchRooms(
    UniqueId userId,
  );
}
