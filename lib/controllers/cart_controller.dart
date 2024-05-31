import 'package:food_ui/controllers/app_controller.dart';
import 'package:food_ui/data/models/cart_model.dart';
import 'package:get/get.dart';

import '../data/models/item_model.dart';

class CartController extends GetxController {
  AppController appController = Get.find();

  List<CartModel> cartItems = [];

 Future<void> getCartItems() async {
    for (int i = 0; i < appController.shopItemsList.length; i++) {
      cartItems.add(
        CartModel(
            itemModel: appController.shopItemsList[i], quantity: itemQuantity),
      );
    }
  }

  String getCartTotalPrice() {
    double cartTotal = 0.0;
    for (int i = 0; i < cartItems.length; i++) {
      cartTotal += double.parse(cartItems[i].itemModel.price) *
          cartItems[i].quantity;
    }
    return cartTotal.toStringAsFixed(2);
  }

  String getItemTotalPrice(ItemModel item, int quantity) {
    double itemTotal = 0.0;
    itemTotal += double.parse(item.price) * quantity;
    return itemTotal.toStringAsFixed(2);
  }



  @override
  void onInit() async{
   await getCartItems();
    super.onInit();
  }

  int itemQuantity = 1;

  increaseAmount(index) {
    cartItems[index].quantity++;
    update();
  }

  decreaseAmount(index) {
    if(cartItems[index].quantity > 0) {
      cartItems[index].quantity--;
      update();
    }
  }

  removeItem(int index){
    cartItems.removeAt(index);
    update();
  }
}
