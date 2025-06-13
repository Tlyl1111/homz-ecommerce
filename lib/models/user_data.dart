class UserData {
  String name;
  String email;
  String? profilePictureUrl;
  bool newArrivalsNotification;
  bool deliveryStatusNotification;
  bool salesNotification;
  int? defaultShippingId;
  int? defaultCardDetailId;
  UserData({
    this.name = "",
    this.email = "",
    this.profilePictureUrl,
    this.newArrivalsNotification = false,
    this.deliveryStatusNotification = true,
    this.salesNotification = true,
    this.defaultShippingId = 0,
    this.defaultCardDetailId = 0,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['Name'],
      email: json['Email'],
      profilePictureUrl: json['profile_picture_url'],
      salesNotification: json['sales_notification'] ?? true,
      deliveryStatusNotification: json['delivery_status_notification'] ?? true,
      defaultShippingId: json['default_shipping_id'],
      defaultCardDetailId: json['default_card_detail_id'],
    );
  }
}
