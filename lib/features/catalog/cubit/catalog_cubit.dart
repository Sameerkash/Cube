import 'dart:convert';

import 'package:cube/common_utils/models/catalog_object.dart';
import 'package:cube/core/networking/networking.dart';
import 'package:cube/core/networking/paths.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CatalogCubit extends Cubit<CatalogStates> {
  CatalogCubit() : super(InitialState()) {
    getCatalogList();
  }
  
  List<CatalogObject> catalogList = [];

  void getCatalogList() async {
    emit(LoadingState());
    CatalogObjectList? _catalogList = await Networking.instance.getRequest<CatalogObjectList>(path: NetworkPaths.catalogList, params: {},type: CatalogObjectList.empty());
    if (_catalogList?.catalog != null || _catalogList?.catalog != []) {
      catalogList = _catalogList!.catalog!;
      emit(LoadedState());
    }
  }

  void addProduct(String name, String desc,int price) async {
    Map<String,dynamic> body = {
        "idempotency_key": const Uuid().v1(),
        "object": {
          "id": "#$name",
          "type": "ITEM",
          "item_data": {
            "abbreviation": name.substring(0,2),
            "description": desc,
            "name": name,
            "variations": [
              {
                "id": "#ONE_SIZE",
                "type": "ITEM_VARIATION",
                "item_variation_data": {
                  "item_id": "#$name",
                  "name": "ONE_SIZE",
                  "pricing_type": "FIXED_PRICING",
                  "price_money": {
                    "amount": price,
                    "currency": "USD"
                  }
                }
              },
            ]
          }
          //   ,
          //   "image_data" : {

          //   }
        }
    };
    emit(CloseBottomSheetState());
    emit(ProductAdditionState(false));
    Response? response = await Networking.instance.postRequest(path: NetworkPaths.addProduct, body: body);
    if (response != null && response.statusCode == 200) {
      CatalogObject newProduct = CatalogObject.fromJson(response.data['catalog_object']);
      catalogList.add(newProduct);
      emit(ProductAdditionState(true));
      emit(LoadedState());
    }
  }
}


abstract class CatalogStates {}

class InitialState extends CatalogStates {}

class LoadingState extends CatalogStates {}

class ProductAdditionState extends CatalogStates {
  ProductAdditionState(this.isCompleted);
  bool isCompleted;
}

class CloseBottomSheetState extends CatalogStates {}

class LoadedState extends CatalogStates {}

