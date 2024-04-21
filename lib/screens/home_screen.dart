
import 'package:eccomerce_redux_mvvm/core/appState/app_state.dart';
import 'package:eccomerce_redux_mvvm/core/models/product.dart';
import 'package:eccomerce_redux_mvvm/core/viewModels/product_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductViewModel>(
      converter: (store) => ProductViewModel.create(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text('E-commerce App'),
          ),
          body: ListView.builder(
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              final Product product = viewModel.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () => viewModel.removeProduct(product),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Product newProduct = Product(
                id: UniqueKey().toString(),
                name: 'New Product',
                price: 10.0,
              );
              viewModel.addProduct(newProduct);
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
