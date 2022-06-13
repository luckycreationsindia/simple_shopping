class Product {
  String id;
  String name;
  String image;
  List<String> tags;
  num price;
  String? description;
  num? discount;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.tags,
    this.description = "",
    this.discount = 0,
  });
}
