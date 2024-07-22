class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.category,
      required this.availableAddons});
}

enum FoodCategory { burgers, salads, sides, pizza, drinks }

class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });
}
