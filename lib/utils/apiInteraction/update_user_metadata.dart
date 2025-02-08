// Imports
import 'dart:convert';

import 'package:http/http.dart';

import '../../models/models.dart';
import '../utils.dart';

/// This function is used to update customer details on the Ecodesk server.
Future<EcodeskCustomer?> updateUserMetadata(
  EcodeskProps p,
  String? cId, {
  Client? client,
}) async {
  client ??= Client();
  EcodeskCustomer? c;
  var json = p.customer!.toJsonString();
  try {
    var res = await client.put(
      Uri.https(p.baseUrl, "/api/customers/$cId/metadata"),
      headers: {
        "Accept": "*/*",
        "Content-Type": "application/json",
      },
      body: '{"metadata": $json}',
    );
    var data = jsonDecode(res.body)["data"];
    c = EcodeskCustomer(
      createdAt: parseDateFromUTC(data["created_at"]),
      email: data["email"],
      externalId: data["external_id"],
      firstSeen: parseDateFromUTC(data["first_seen"]),
      id: data["id"],
      lastSeenAt: parseDateFromUTC(data["last_seen_at"]),
      updatedAt: parseDateFromUTC(data["updated_at"]),
      name: data["name"],
      phone: data["phone"],
    );
  } catch (e) {
    c = null;
  }

  client.close();
  return c;
}
