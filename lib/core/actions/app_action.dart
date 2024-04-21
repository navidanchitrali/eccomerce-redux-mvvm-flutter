 
import 'package:eccomerce_redux_mvvm/core/models/product.dart';

class AddProductAction {
  final Product product;

  AddProductAction(this.product);
}

class RemoveProductAction {
  final Product product;

  RemoveProductAction(this.product);
}
