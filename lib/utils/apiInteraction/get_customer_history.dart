//Imports
import 'update_user_metadata.dart';

import '../../models/models.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'dart:async';

import 'get_customer_details_from_metadata.dart';
import 'get_past_customer_messages.dart';
import '../socket/join_conversation.dart';

/// This function is used to get the history.
/// It also initializes the necessary funtions if the customer is known.
Future<bool> getCustomerHistory({
  required EcodeskProps props,
  EcodeskCustomer? c,
  required Function setCustomer,
  List<EcodeskMessage>? messages,
  PhoenixChannel? conversationChannel,
  Function? setConversationChannel,
  Function? rebuild,
  PhoenixSocket? socket,
}) async {
  var failed = true;
  try {
    // Get customer details.
    var customer = await getCustomerDetailsFromMetadata(
      props,
      c,
      setCustomer,
    );
    failed = false;
    if (customer.id != null) {
      // If customer is not null and there is an ID get the past messages.
      var data = await getPastCustomerMessages(props, customer);
      if (data["msgs"] != null) failed = false;
      if (data["msgs"].isNotEmpty) {
        {
          // If there are messages to load sort them by date.
          var msgsIn = data["msgs"] as List<EcodeskMessage>;
          msgsIn.sort((a, b) {
            return a.createdAt!.compareTo(b.createdAt!);
          });
          // Add them to the message list.
          messages!.addAll(msgsIn);
        }
        // Get the first message (as we know there is at leat one messgae)
        // We use this to get the details we need to join a conversation.
        var msgToProcess = data["msgs"][0] as EcodeskMessage;
        joinConversationAndListen(
          convId: msgToProcess.conversationId!,
          conversation: conversationChannel,
          setChannel: setConversationChannel!,
          setState: rebuild,
          socket: socket!,
          messages: messages,
        );
      }
      if (data["cust"] != null && data["cust"] != customer) {
        // Determine if we need to update the customer details.
        var nCust = await updateUserMetadata(props, data["cust"].id);
        if (nCust == null) {
          // Will only return null if the update failed.
          failed = true;
        } else if (nCust != customer) {
          // If the new customer is different then we update the details we have.
          setCustomer(nCust);
          rebuild!(() {}, animate: true);
        }
      }
    }
  } catch (e) {
    failed = true;
  }
  return failed;
}
