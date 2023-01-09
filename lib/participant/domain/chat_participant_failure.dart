import '../../shared/domain/url/url_failure.dart';

typedef ChatParticipantFailureInvalidType = _ChatParticipantFailureInvalidType;
typedef ChatParticipantFailureInvalidPhotoUrl = _ChatParticipantFailureInvalidPhotoUrl;

abstract class ChatParticipantFailure {
  const ChatParticipantFailure();
  const factory ChatParticipantFailure.invalidType() = _ChatParticipantFailureInvalidType;
  const factory ChatParticipantFailure.invalidPhotoUrl(UrlFailure failure) = _ChatParticipantFailureInvalidPhotoUrl;

  void when({
    required void Function(ChatParticipantFailureInvalidType) invalidType,
    required void Function(ChatParticipantFailureInvalidPhotoUrl) invalidPhotoUrl,
  }) {
    if (this is _ChatParticipantFailureInvalidType) {
      return invalidType.call(this as _ChatParticipantFailureInvalidType);
    }

    if (this is _ChatParticipantFailureInvalidPhotoUrl) {
      return invalidPhotoUrl.call(this as _ChatParticipantFailureInvalidPhotoUrl);
    }

    invalidType.call(this as _ChatParticipantFailureInvalidType);
  }

  R map<R>({
    required R Function(ChatParticipantFailureInvalidType) invalidType,
    required R Function(ChatParticipantFailureInvalidPhotoUrl) invalidPhotoUrl,
  }) {
    if (this is _ChatParticipantFailureInvalidType) {
      return invalidType.call(this as _ChatParticipantFailureInvalidType);
    }

    if (this is _ChatParticipantFailureInvalidPhotoUrl) {
      return invalidPhotoUrl.call(this as _ChatParticipantFailureInvalidPhotoUrl);
    }

    return invalidType.call(this as _ChatParticipantFailureInvalidType);
  }

  void maybeWhen({
    void Function(ChatParticipantFailureInvalidType)? invalidType,
    void Function(ChatParticipantFailureInvalidPhotoUrl)? invalidPhotoUrl,
    required void Function() orElse,
  }) {
    if (this is _ChatParticipantFailureInvalidType && invalidType != null) {
      return invalidType.call(this as _ChatParticipantFailureInvalidType);
    }

    if (this is _ChatParticipantFailureInvalidPhotoUrl && invalidPhotoUrl != null) {
      return invalidPhotoUrl.call(this as _ChatParticipantFailureInvalidPhotoUrl);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(ChatParticipantFailureInvalidType)? invalidType,
    R Function(ChatParticipantFailureInvalidPhotoUrl)? invalidPhotoUrl,
    required R Function() orElse,
  }) {
    if (this is _ChatParticipantFailureInvalidType && invalidType != null) {
      return invalidType.call(this as _ChatParticipantFailureInvalidType);
    }

    if (this is _ChatParticipantFailureInvalidPhotoUrl && invalidPhotoUrl != null) {
      return invalidPhotoUrl.call(this as _ChatParticipantFailureInvalidPhotoUrl);
    }

    return orElse.call();
  }

  factory ChatParticipantFailure.fromString(String value) {
    if (value == 'invalidType') {
      return const ChatParticipantFailure.invalidType();
    }

    return const ChatParticipantFailure.invalidType();
  }

  @override
  String toString() {
    if (this is _ChatParticipantFailureInvalidType) {
      return 'invalidType';
    }

    if (this is _ChatParticipantFailureInvalidPhotoUrl) {
      return 'invalidPhotoUrl';
    }

    return 'invalidType';
  }
}

class _ChatParticipantFailureInvalidType extends ChatParticipantFailure {
  const _ChatParticipantFailureInvalidType();
}

class _ChatParticipantFailureInvalidPhotoUrl extends ChatParticipantFailure {
  final UrlFailure failure;

  const _ChatParticipantFailureInvalidPhotoUrl(this.failure);
}
