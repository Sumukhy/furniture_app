class FurnitureModel {
  final int id;
  final String title;
  final String description;
  final bool is_liked;
  final double price;
  final String image;

  const FurnitureModel(
      {required this.description,
      required this.id,
      required this.image,
      required this.is_liked,
      required this.price,
      required this.title});
}
