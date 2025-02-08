import '../../models/models.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import '../utils.dart';

/// This function will join the channel and listen to new messages.
PhoenixChannel? joinConversationAndListen({
  List<EcodeskMessage>? messages,
  required String convId,
  required PhoenixChannel? conversation,
  required PhoenixSocket socket,
  required Function? setState,
  required Function setChannel,
}) {
  // Adding the channel.
  conversation = socket.addChannel(topic: "conversation:$convId");
  // Joining channel.
  if (conversation.state == PhoenixChannelState.closed) conversation.join();
  // Function to set the channel.
  setChannel(conversation);
  // Add the listener that will check for new messages.
  conversation.messages.listen(
    (event) {
      if (event.payload != null) {
        if (event.payload!["status"] == "error") {
          // If there is an error, shutdown the channels and remove it.
          conversation!.close();
          socket.removeChannel(conversation!);
          conversation = null;
        } else {
          if (event.event.toString().contains("shout") ||
              event.event.toString().contains("message:created") ||
              event.payload!["type"] == "reply") {
            // https://github.com/ecodesk-io/ecodesk/pull/488
            // "message:created" is still not implemented see the PR above.
            if (event.payload!["customer"] == null) {
              setState!(() {
                messages!.add(
                  EcodeskMessage(
                    accountId: event.payload!["account_id"],
                    body: event.payload!["body"].toString().trim(),
                    conversationId: event.payload!["conversation_id"],
                    customerId: event.payload!["customer_id"],
                    id: event.payload!["id"],
                    attachments: (event.payload!["attachments"] != null)
                        ? (event.payload!["attachments"] as List<dynamic>)
                            .map(
                              (attachment) => EcodeskAttachment(
                                contentType: attachment["content_type"],
                                fileName: attachment["filename"],
                                fileUrl: attachment["file_url"],
                                id: attachment["id"],
                              ),
                            )
                            .toList()
                        : null,
                    fileIds: (event.payload!["attachments"] != null)
                        ? (event.payload!["attachments"] as List<dynamic>)
                            .map((attachment) => attachment["id"] as String)
                            .toList()
                        : null,
                    user: (event.payload!["user"] != null)
                        ? User(
                            email: event.payload!["user"]["email"],
                            id: event.payload!["user"]["id"],
                            role: event.payload!["user"]["role"],
                            displayName: event.payload!["user"]["display_name"],
                            profilePhotoUrl: event.payload!["user"]
                                ["profile_photo_url"],
                          )
                        : null,
                    customer: (event.payload!["customer"] != null)
                        ? EcodeskCustomer(
                            email: event.payload!["customer"]["email"],
                            id: event.payload!["customer"]["id"],
                          )
                        : null,
                    userId: event.payload!["user_id"],
                    createdAt: parseDateFromUTC(event.payload!["created_at"]),
                    seenAt: parseDateFromUTC(event.payload!["seen_at"]),
                    sentAt: parseDateFromUTC(event.payload!["sent_at"]),
                  ),
                );
              }, animate: true);
            }
          }
        }
      }
    },
  );
  return conversation;
}
