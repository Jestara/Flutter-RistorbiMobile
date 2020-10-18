import 'package:get_it/get_it.dart';
import 'package:ristorbi/Repository/AreaRepository.dart';
import 'package:ristorbi/Repository/CategoryRepository.dart';
import 'package:ristorbi/Repository/TableRepository.dart';
import 'package:ristorbi/Service/AreaService.dart';
import 'package:ristorbi/Service/CategoryService.dart';
import 'package:ristorbi/Service/TableService.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => TableRepository());
  locator.registerLazySingleton(() => TableService());
  locator.registerLazySingleton(() => CategoryRepository());
  locator.registerLazySingleton(() => CategoryService());
  locator.registerLazySingleton(() => AreaService());
  locator.registerLazySingleton(() => AreaRepository());
}