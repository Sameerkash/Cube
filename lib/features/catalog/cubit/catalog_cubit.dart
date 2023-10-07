import 'dart:convert';

import 'package:cube/core/networking/networking.dart';
import 'package:cube/models/catalog_object.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogCubit extends Cubit<CatalogStates> {
  CatalogCubit() : super(InitialState()) {
    getCatalogList();
  }

  void getCatalogList() async {
    emit(LoadingState());
    CatalogObjectList? catalogList = await Networking.instance.getRequest<CatalogObjectList>(path: 'catalog/list', params: {},type: CatalogObjectList.empty());
    if (catalogList != null || catalogList?.catalog != []) {
      emit(LoadedState(catalogList!.catalog!));
    }
  }
}


abstract class CatalogStates {}

class InitialState extends CatalogStates {}

class LoadingState extends CatalogStates {}

class LoadedState extends CatalogStates {
  LoadedState(this.catalog);
  List<CatalogObject> catalog;
}

