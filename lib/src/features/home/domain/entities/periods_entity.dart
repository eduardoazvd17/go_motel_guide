class PeriodsEntity {
  final String formattedTime;
  final String time;
  final double price;
  final double totalPrice;
  final bool hasCourtesy;
  final double discount;

  PeriodsEntity({
    required this.formattedTime,
    required this.time,
    required this.price,
    required this.totalPrice,
    required this.hasCourtesy,
    required this.discount,
  });
}
