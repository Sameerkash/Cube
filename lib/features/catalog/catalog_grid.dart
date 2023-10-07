import 'package:cube/features/catalog/catalog_item.dart';
import 'package:cube/models/catalog_object.dart';
import 'package:flutter/material.dart';

class CatalogGrid extends StatelessWidget {
  CatalogGrid(this.catalog, {Key? key}) : super(key: key);

  List<CatalogObject> catalog;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: catalog.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CatalogItem(data: catalog[index].itemData);
      },
    );
  }
}
