/// This is the class which contains all customer info.
class EcodeskCustomer {
  /// Date of Customer creation.
  DateTime? createdAt;

  /// Email of the customer.
  String? email;

  /// Name of the customer.
  String? name;

  /// Phone of the customer
  String? phone;

  /// External ID used to identify the customer with the Ecodesk API.
  String? externalId;

  /// The time where the customer was first seen.
  DateTime? firstSeen;

  /// The unique identifier of the customer on the Ecodesk system.
  String? id;

  /// When the customer was last seen.
  DateTime? lastSeenAt;

  /// When the customer details were last updated.
  DateTime? updatedAt;

  EcodeskCustomer({
    this.createdAt,
    this.email,
    this.externalId,
    this.firstSeen,
    this.id,
    this.lastSeenAt,
    this.updatedAt,
    this.name,
    this.phone,
  });
}
