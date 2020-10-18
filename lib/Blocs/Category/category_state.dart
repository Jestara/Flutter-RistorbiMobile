import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ristorbi/Models/Category.dart';
abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState{
  @override
  List<Object> get props => throw UnimplementedError();

}

class CategoryLoadedState extends CategoryState{

  List<Category> categories;

  CategoryLoadedState({@required this.categories});
   @override
  List<Object> get props => [categories];

}

class CategoryErrorState extends CategoryState{
  @override
  List<Object> get props => throw UnimplementedError('CATEGORİES ERROR !!');

}