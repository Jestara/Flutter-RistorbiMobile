import 'package:ristorbi/Models/Area.dart';
import 'package:ristorbi/Service/AreaService.dart';

import '../locator.dart';

class AreaRepository {
  AreaService _areaService = locator<AreaService>();

  Future<List<Area>> getAreas() async{
      return await _areaService.getAreas();
  }
}