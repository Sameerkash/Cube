import 'package:cube/auth/secrets.dart';
import 'package:cube/core/networking/networking.dart';
import 'package:cube/core/networking/paths.dart';
import 'package:cube/features/finance/models/order_object.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  OrdersCubit() : super(OrdersLoadingState()) {
    getAllOrders();
  }

  void getAllOrders() async {
    emit(OrdersLoadingState());
    Response? response = await Networking.instance.postRequest(
        path: NetworkPaths.squareBaseUrl + NetworkPaths.orderList,
        body: {
          "location_ids": [Secrets.squareLocationId]
        },
        headers: Networking.squareHeaders);

    if (response != null && response.statusCode == 200) {
      print("orders1 : ${response.data['orders']}");
      List<OrderObject> orders = List<OrderObject>.from(
          (response.data['orders']).map((x) {
              OrderObject order = OrderObject.fromJson(x);
              return order;
          }));
      print("orders : ${orders.length}");
      emit(OrdersLoadedState(orders));
    } else {
      emit(ErrorState());
    }
  }
}

abstract class OrdersStates {}

class OrdersLoadingState extends OrdersStates {}

class OrdersLoadedState extends OrdersStates {
  List<OrderObject> orders;
  OrdersLoadedState(this.orders);
}

class ErrorState extends OrdersStates {}
