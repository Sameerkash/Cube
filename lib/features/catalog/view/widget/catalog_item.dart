import 'package:cube/common_utils/models/catalog_object.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  CatalogItem({Key? key,required this.data}) : super(key: key);

  CatalogItemData? data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(height: 100,width: 100,color: Colors.blueAccent,),
          Text(data?.name ?? ""),
          Text(data?.description ?? ""),
        ],
      ),
    );
  }
}
