class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}
