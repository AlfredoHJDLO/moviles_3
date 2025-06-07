class ProductModel {
  int id;
  String title;
  String description;
  double price;
  String category;
  String image;

  //constructor
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromJSON(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      category: json['category'],
      image: json['image']);
  }

  // conversor a JSON
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, category: $category)';
  }
}
