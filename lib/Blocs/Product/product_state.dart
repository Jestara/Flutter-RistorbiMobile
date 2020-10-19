part of 'product_bloc.dart';

abstract class ProductState{
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState{
  @override
  List<Object> get props => throw UnimplementedError();
}

class ProductLoadedState extends ProductState{

  List<Product> products;
  ProductLoadedState({@required this.products});

  @override
  List<Object> get props => [products];
}

class ProductErrorState extends ProductState{
  @override
  List<Object> get props => throw UnimplementedError();

}

