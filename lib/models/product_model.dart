class ProductModel {
  int id;
  String title;
  String description;
  double price;
  String category;
  String media;  // El campo 'media' es para la ruta o nombre del archivo de la imagen o video

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.media,
  });

  // Factory para crear un ProductModel desde un JSON
  factory ProductModel.fromJSON(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      category: json['category'],
      media: json['media'],
    );
  }

  // Conversor a JSON para enviar al backend
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'media': media,
    };
  }

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, category: $category)';
  }
}
