class GroceryItem {
  int? id;
  String? name;
  bool purchased = false;

  GroceryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    purchased = json['purchased'];
  }
}
