
import 'package:flutter/material.dart';

@immutable
abstract class ProductEvent {}

class GetProductByCategoryId extends ProductEvent {
  final int categoryId;

  GetProductByCategoryId({@required this.categoryId});
}