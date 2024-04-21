
import 'package:eccomerce_redux_mvvm/core/actions/app_action.dart';
import 'package:eccomerce_redux_mvvm/core/appState/app_state.dart';
import 'package:eccomerce_redux_mvvm/core/models/product.dart';
import 'package:redux/redux.dart';

class ProductViewModel {
  final List<Product> products;
  final Function(Product) addProduct;
  final Function(Product) removeProduct;

  ProductViewModel({
    required this.products,
    required this.addProduct,
    required this.removeProduct,
  });

  factory ProductViewModel.create(Store<AppState> store) {
    _addProduct(Product product) {
      store.dispatch(AddProductAction(product));
    }

    _removeProduct(Product product) {
      store.dispatch(RemoveProductAction(product));
    }

    return ProductViewModel(
      products: store.state.products,
      addProduct: _addProduct,
      removeProduct: _removeProduct,
    );
  }
}
