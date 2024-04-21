import 'package:eccomerce_redux_mvvm/core/appState/app_state.dart';
import 'package:eccomerce_redux_mvvm/core/reducers/app_reducer.dart';
import 'package:eccomerce_redux_mvvm/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    // middleware: [thunkMiddleware],
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
