class ProyekModel {
  final String id;
  final String imageUrl;
  final String description;
  final String category;

  ProyekModel({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.category,
  });

  factory ProyekModel.fromJson(Map<String, dynamic> json) {
    return ProyekModel(
      id: json['id'],      
      description: json['description'],     
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }
}
