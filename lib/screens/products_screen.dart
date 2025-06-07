import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda/models/product_model.dart';
import 'package:tienda/providers/product_providers.dart';
import 'package:tienda/screens/add_products_screen.dart';
import 'package:tienda/screens/product_details.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProviders = Provider.of<ProductProviders>(
      context,
      listen: false,
    );

    // *Si la lista de productos está vacía, se llama a la función para obtener los productos.
    if (productProviders.products.isEmpty) {
      productProviders.fetchProducts();
    }

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Consumer<ProductProviders>(
        builder: (context, provider, child) {
          // *Si la lista de productos está vacía, se muestra un indicador de carga.
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.products.isEmpty) {
            // *Si la lista de productos sigue vacía después de la carga, se muestra un mensaje.
            return Center(child: Text('Producto no disponible'));
          }

          // *Muestra las cards de productos
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _productCard(context, provider.products[index]),
              );
            },
          );

        },
      ),
      // *Botón flotante para añadir un nuevo producto
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );
        },
        backgroundColor: colors.primary,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // *Tarjeta de producto
  Widget _productCard(BuildContext context, ProductModel product) {
    final colors = Theme.of(context).colorScheme;
    final productProvider = Provider.of<ProductProviders>(
      context,
      listen: false,
    );
    bool isInCart = productProvider.isProductInCart(product.id);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(product: product),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Imagen
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 12),
              // Información
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                                (i) => Icon(
                              i < 5 ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 16,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            productProvider.toggleCartStatus(product);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: isInCart
                                  ? Colors.grey.shade300
                                  : colors.primaryContainer,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              isInCart
                                  ? Icons.shopping_cart
                                  : Icons.add_shopping_cart,
                              size: 20,
                              color:
                              isInCart ? Colors.black54 : colors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
