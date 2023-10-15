import 'package:cube/core/widgets/custom_button.dart';
import 'package:cube/core/widgets/custom_text_field.dart';
import 'package:cube/features/catalog/cubit/catalog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  TextEditingController productName = TextEditingController();
  TextEditingController productDesc = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  late CatalogCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CatalogCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            spacer(),
            CustomTextField(hintText: 'What is your product called ?', controller: productName, keyboardType: TextInputType.text),
            spacer(),
            CustomTextField(hintText: 'Describe the product in few words', controller: productDesc, keyboardType: TextInputType.text),
            spacer(),
            CustomTextField(hintText: 'Price for the product', controller: productPrice, keyboardType: TextInputType.number),
            spacer(),
            CustomButton(title: 'Add', onTap: () {_cubit.addProduct(productName.text, productDesc.text, int.parse(productPrice.text));},gradientColors: const [Colors.blue,Colors.white],)
          ],
        ),
      ),
    );
  }
}

Widget spacer() => const SizedBox(height: 20);
