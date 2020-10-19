import 'package:ristorbi/Models/Product.dart';
import 'package:ristorbi/Service/ProductService.dart';
import 'package:ristorbi/locator.dart';

class ProductRepository {
  final ProductService _productService = locator<ProductService>();
ProductRepository(){}
  Future<List<Product>> getProductsByCategoryId(int categoryId) async{

    return await _productService.getProductsByCategoryId(categoryId);
  }
}