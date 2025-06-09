class FavoritoModel {
  int id;
  int userId;
  int productoId;

  FavoritoModel({
    required this.id,
    required this.userId,
    required this.productoId,
  });

  factory FavoritoModel.fromJSON(Map<String, dynamic> json) {
    return FavoritoModel(
      id: json['id'],
      userId: json['user_id'],
      productoId: json['producto_id'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {'id': id, 'user_id': userId, 'producto_id': productoId};
  }
}
