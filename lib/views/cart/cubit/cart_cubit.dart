import 'package:ecommerce/mock/cart/cart_product_mock_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../state/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  int price = 3300;

  void productCountRemove(int index) {
    if (CartProductMockData.count[index]["count"] != 0) {
      CartProductMockData.count[index]["count"] -= 1;
      CartProductMockData.price["price"] -=
          CartProductMockData.count[index]["price"];
      emit(
        CartComplete(
          CartProductMockData.count[index]["count"],
          CartProductMockData.price["price"],
        ),
      );
    }
  }

  void productCountAdd(int index) {
    if (CartProductMockData.count[index]["count"] != 9) {
      CartProductMockData.count[index]["count"] += 1;
      CartProductMockData.price["price"] +=
          CartProductMockData.count[index]["price"];

      emit(
        CartComplete(
          CartProductMockData.count[index]["count"],
          CartProductMockData.price["price"],
        ),
      );
    }
  }
}
