import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../config/shop_item_names.dart';
import '../data/models/item_model.dart';
import 'app_controller.dart';

class ExploreController extends GetxController {




  static String imageAddress(String item) {
    return 'assets/shop_items/$item.png';
  }

  final List<ItemModel> exploreList = [
    ItemModel(
        name: 'drinks',
        description: '',
        price: '10',
        image: imageAddress(drinks)),
    ItemModel(
        name: 'vegetables',
        description: '',
        price: '10',
        image: imageAddress(veg)),
    ItemModel(
        name: 'bread',
        description: '',
        price: '10',
        image: imageAddress(bread)),
    ItemModel(
        name: 'meat', description: '', price: '10', image: imageAddress(meet)),
    ItemModel(
        name: 'seafood',
        description: '',
        price: '10',
        image: imageAddress(seafood)),
    ItemModel(
        name: 'cheese',
        description: '',
        price: '10',
        image: imageAddress(cheese)),
  ];
}
