class MetalPriceModel {
  final String name;
  final double price;
  final String symbol;
  final DateTime updatedAt;
  final String updatedAtReadable;

  MetalPriceModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
  });

  factory MetalPriceModel.fromJson(Map<String, dynamic> json) {
    return MetalPriceModel(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      symbol: json['symbol'],
      updatedAt: DateTime.parse(json['updatedAt']),
      updatedAtReadable: json['updatedAtReadable'],
    );
  }
}
