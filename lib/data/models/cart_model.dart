import 'package:food_ui/data/models/item_model.dart';

class CartModel {
  final ItemModel itemModel;
   int quantity;
  CartModel({required this.itemModel, required this.quantity});
}