
import 'package:ristorbi/Models/Category.dart';
import 'package:ristorbi/Service/CategoryService.dart';
import 'package:ristorbi/locator.dart';

class CategoryRepository{
    final CategoryService _categoryService = locator<CategoryService>();

      Future<List<Category>> getCategories() async{
            return await _categoryService.getCategories();
      }

}