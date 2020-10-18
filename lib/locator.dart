import 'package:get_it/get_it.dart';
import 'package:ristorbi/Repository/TableRepository.dart';
import 'package:ristorbi/Service/TableService.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => TableRepository());
  locator.registerLazySingleton(() => TableService());
}