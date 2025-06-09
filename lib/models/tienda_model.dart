class TiendaModel {
  int id;
  String title;
  String description;
  double price;
  String category;
  String media;

  TiendaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.media,
  });

  factory TiendaModel.fromJSON(Map<String, dynamic> json) {
    return TiendaModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      category: json['category'],
      media: json['media'],
    );
  }

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
}
