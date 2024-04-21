 
import 'package:eccomerce_redux_mvvm/core/actions/app_action.dart';
import 'package:eccomerce_redux_mvvm/core/appState/app_state.dart';
import 'package:eccomerce_redux_mvvm/core/models/product.dart';
import 'package:redux/redux.dart';


AppState appReducer(AppState state, dynamic action) {
  return AppState(
    products: productsReducer(state.products, action),
  );
}

final Reducer<List<Product>> productsReducer = combineReducers<List<Product>>([
  TypedReducer<List<Product>, AddProductAction>(_addProduct),
  TypedReducer<List<Product>, RemoveProductAction>(_removeProduct),
]);

List<Product> _addProduct(List<Product> products, AddProductAction action) {
  return List.from(products)..add(action.product);
}

List<Product> _removeProduct(List<Product> products, RemoveProductAction action) {
  return List.from(products)..remove(action.product);
}
