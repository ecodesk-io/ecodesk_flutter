// Imports
import '../../models/models.dart';
import '../../ecodesk_flutter.dart';
import 'package:phoenix_socket/phoenix_socket.dart';

/// This function creates the necessary channels, sockets and rooms for ecodesk to communicate.
initChannels(
  bool connected,
  PhoenixSocket socket,
  PhoenixChannel? channel,
  EcodeskProps props,
  bool canJoinConversation,
  Function setState,
) {
  if (connected & socket.channels.isEmpty) {
    channel = socket.addChannel(
      topic: 'room:${props.accountId}',
    );
    channel.join().onReply(
      "ok",
      (res) {
        if (res.isOk && !canJoinConversation) {
          canJoinConversation = true;
        }
      },
    );
  }
}
