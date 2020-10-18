import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ristorbi/Models/Category.dart';
import 'package:ristorbi/Repository/CategoryRepository.dart';
import 'package:ristorbi/locator.dart';

import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository = locator<CategoryRepository>();
  CategoryBloc() : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    // TODO: implement mapEventToState
      switch(event){
        case CategoryEvent.getCategories:
          yield CategoryLoadingState();
          try {
            final _categories = await _categoryRepository.getCategories();
               yield CategoryLoadedState(categories: _categories);

          } catch(error){
              yield CategoryErrorState();
          }
      }

  }
}
