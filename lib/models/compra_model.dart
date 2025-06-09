class CompraModel {
  int id;
  int userId;
  int productoId;
  DateTime fecha;

  CompraModel({
    required this.id,
    required this.userId,
    required this.productoId,
    required this.fecha,
  });

  factory CompraModel.fromJSON(Map<String, dynamic> json) {
    return CompraModel(
      id: json['id'],
      userId: json['user_id'],
      productoId: json['producto_id'],
      fecha: DateTime.parse(json['fecha']),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'user_id': userId,
      'producto_id': productoId,
      'fecha': fecha.toIso8601String(),
    };
  }
}
