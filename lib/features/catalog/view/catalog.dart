import 'dart:ui';

import 'package:cube/core/widgets/loader.dart';
import 'package:cube/features/catalog/models/catalog_object.dart';
import 'package:cube/features/catalog/view/add_product_screen.dart';
import 'package:cube/features/catalog/view/widget/catalog_grid.dart';
import 'package:cube/features/catalog/cubit/catalog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  late CatalogCubit _cubit;
  bool displayOverLayLoader = false;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CatalogCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddProductBottomSheet(context);
        },
        child: const Icon(Icons.add),
        backgroundColor : Colors.yellowAccent,
      ),
      body: BlocConsumer<CatalogCubit, CatalogStates>(
          listenWhen: (prev, cur) =>
              (cur is CloseBottomSheetState || cur is ProductAdditionState),
          listener: (context, state) {
            if (state is CloseBottomSheetState) {
              Navigator.of(context).pop();
            } else if (state is ProductAdditionState) {
              displayOverLayLoader = !state.isCompleted;
            }
          },
          buildWhen: (prev, cur) => (cur is LoadingState ||
              cur is LoadedState ||
              cur is ProductAdditionState),
          builder: (context, state) {
            if (state is LoadingState) {
              return AppLoader(tagLine : "Bringing your products here....");
            } else if (state is LoadedState || state is ProductAdditionState) {
              return Stack(
                children: [
                  CatalogGrid(_cubit.catalogList),
                  if (displayOverLayLoader)
                    BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: displayOverLayLoader ? 5 : 0,
                          sigmaY: displayOverLayLoader ? 5 : 0,
                        ),
                        child: AppLoader(tagLine : "Adding your product....")),
                ],
              );
            } else {
              return const Center(
                child: Text("some error occurred"),
              );
            }
          }),
    );
  }

  void showAddProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BlocProvider.value(
              value: _cubit, child: const AddProductScreen());
        });
  }
}
