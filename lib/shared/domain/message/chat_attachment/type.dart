part of 'chat_attachment.dart';

enum ChatAttachmentType {
  image,
  audio,
  video,
  file;

  T map<T>(
    T Function() image,
    T Function() audio,
    T Function() video,
    T Function() file,
  ) {
    switch (this) {
      case ChatAttachmentType.image:
        return image.call();
      case ChatAttachmentType.audio:
        return audio.call();
      case ChatAttachmentType.video:
        return video.call();
      case ChatAttachmentType.file:
        return file.call();
    }
  }

  FutureOr<void> when<T>(
    FutureOr<void> Function() image,
    FutureOr<void> Function() audio,
    FutureOr<void> Function() video,
    FutureOr<void> Function() file,
  ) {
    switch (this) {
      case ChatAttachmentType.image:
        return image.call();
      case ChatAttachmentType.audio:
        return audio.call();
      case ChatAttachmentType.video:
        return video.call();
      case ChatAttachmentType.file:
        return file.call();
    }
  }
}
