class KatalogModel {
  final String id;
  final String title;
  final String description;
  final double priceMinimum;
  final double priceMaximum;
  final String imageUrl;
  final String category;

  KatalogModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priceMinimum,
    required this.priceMaximum,
    required this.imageUrl,
    required this.category,
  });

  factory KatalogModel.fromJson(Map<String, dynamic> json) {
    return KatalogModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      priceMinimum: (json['priceMinimum'] as num).toDouble(),
      priceMaximum: (json['priceMaximum'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }
}
