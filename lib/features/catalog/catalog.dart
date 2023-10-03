import 'package:cube/features/catalog/brain/brain.dart';
import 'package:flutter/material.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {

  CatalogBrain brain = CatalogBrain();

  @override
  void initState() {
    super.initState();
    brain.getCatalogList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,height: 100,width: 100,);
  }
}