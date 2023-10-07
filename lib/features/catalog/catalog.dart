import 'package:cube/features/catalog/catalog_grid.dart';
import 'package:cube/features/catalog/cubit/catalog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogCubit,CatalogStates>(
      builder: (context,state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is LoadedState) {
          return CatalogGrid(state.catalog);
        } else {
          return const Center(child: Text("some error occurred"),);
        }

      }
    );
  }
}