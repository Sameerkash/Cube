import 'package:cube/core/networking/networking.dart';

class CatalogBrain {

  void getCatalogList() {
    final value = Networking.instance.getRequest(path: 'catalog/list', params: {});
    print("catalog value is $value");
  }
}