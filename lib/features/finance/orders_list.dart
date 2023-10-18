import 'package:cube/common_utils/text_style.dart';
import 'package:cube/core/widgets/loader.dart';
import 'package:cube/features/finance/cubit/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  late OrdersCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<OrdersCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersStates>(
        buildWhen: (prev, cur) =>
            (cur is OrdersLoadingState || cur is OrdersLoadedState || cur is ErrorState),
        builder: (context, state) {
          if (state is OrdersLoadingState) {
            return AppLoader(tagLine: "Bringing your orders here....");
          } else if (state is OrdersLoadedState) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
              return ListTile(
                  leading: SvgPicture.asset('assets/images/creditcard-face.svg',color: Colors.white,),
                  title: Text(
                    state.orders[index].source?.name.substring(0,10) ?? '',
                    style: AppTextStyle.smallHeading,
                  ),
              subtitle: Text(
                (state.orders[index].totalMoney?.amount ?? '').toString(),
                style: AppTextStyle.regular,
              ),);
            });
          } else {
            return const Center(
              child: Text("some error occurred"),
            );
          }
        });
  }
}
