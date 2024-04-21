import 'package:eccomerce_redux_mvvm/core/models/product.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
  final List<Product> products;

  AppState({required this.products});

  factory AppState.initial() => AppState(products: []);

  AppState copyWith({List<Product>? products}) {
    return AppState(products: products ?? this.products);
  }
}
