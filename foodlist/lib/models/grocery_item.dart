enum Category {
  bakeries,
  fastFood,
  frozen,
  dairy,
  meat,
  miscellaneous,
}

const groceryItemCategoryMap = {
  Category.bakeries: 'bakeries',
  Category.fastFood: 'fast-food',
  Category.frozen: 'frozen',
  Category.dairy: 'dairy',
  Category.meat: 'meat',
  Category.miscellaneous: 'miscellaneous',
};

class GroceryItem {
  int? id;
  Category? category;
  String name = '';
  bool purchased = false;

  GroceryItem(){
    // TODO: set some addintional defau
  }

  GroceryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'] != null
        ? GroceryItem.categoryFromString(json['category'])
        : Category.miscellaneous;
    purchased = json['purchased'];
  }

  get categoryLabel {
    if (category == null) {
      return 'Miscellaneous';
    }
    return GroceryItem.stringFromCategory(category!);
  }

  static Category? categoryFromString(String category) {
    return groceryItemCategoryMap.entries
        .firstWhere((entry) => entry.value == category)
        .key;
  }

  static String? stringFromCategory(Category category) {
    return groceryItemCategoryMap[category];
  }
}
