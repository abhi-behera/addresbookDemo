class Address {
  String? addressType;
  String? address1;
  String? address2;
  String? country;
  String? state;
  String? city;
  String? zip;
  bool? preference;

  Address(
      {this.addressType,
      this.address1,
      this.address2,
      this.city,
      this.country,
      this.state,
      this.zip,
      this.preference});
}
