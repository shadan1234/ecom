class Address {
  final String shortLabel;
  final String? fullAddress;
  final double? lat;
  final double? lng;

  Address({required this.shortLabel, this.fullAddress, this.lat, this.lng});

  // Add equality and hashCode for provider logic
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address && shortLabel == other.shortLabel && fullAddress == other.fullAddress && lat == other.lat && lng == other.lng;

  @override
  int get hashCode => shortLabel.hashCode ^ (fullAddress?.hashCode ?? 0) ^ (lat?.hashCode ?? 0) ^ (lng?.hashCode ?? 0);
}
