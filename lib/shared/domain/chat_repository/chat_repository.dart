import 'package:firebase_chat/participant/domain/basic_chat_participant.dart';
import 'package:firebase_chat/shared/domain/chat_repository/room_creation_failure.dart';
import 'package:firebase_chat/shared/domain/core/result_or.dart';

abstract class ChatRepository {
  Future<ResultOr<RoomCreationFailure>> createRoom(
    Set<BasicChatParticipant> chatParticipants,
  );
}
