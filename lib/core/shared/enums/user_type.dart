/// The three kinds of account. The name is sent / stored as-is.
enum UserType {
  client,
  delivery,
  merchant;

  bool get isClient => this == UserType.client;
  bool get isDelivery => this == UserType.delivery;
  bool get isMerchant => this == UserType.merchant;

  static UserType fromName(String? name) => UserType.values.firstWhere(
    (e) => e.name == name,
    orElse: () => UserType.client,
  );
}
