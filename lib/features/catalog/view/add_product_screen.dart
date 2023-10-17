import 'dart:io';
import 'dart:ui';

import 'package:cube/common_utils/colors.dart';
import 'package:cube/common_utils/text_style.dart';
import 'package:cube/core/widgets/custom_button.dart';
import 'package:cube/core/widgets/custom_text_field.dart';
import 'package:cube/core/widgets/product_description_card.dart';
import 'package:cube/features/catalog/cubit/catalog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _image;
  String? imagePath;
  final picker = ImagePicker();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CatalogCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: Stack(
        children: [
          Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                spacer(),
                heading('ADD IMAGES'),
                AddProductImage(),
                spacer(),
                heading('PRODUCT TITLE'),
                CustomTextField(
                    hintText: 'What is the name of this product?',
                    controller: productName,
                    keyboardType: TextInputType.text),
                spacer(),
                heading('PRODUCT TITLE'),
                CustomTextField(
                    hintText: 'Give a bit of description about the product ?',
                    controller: productDesc,
                    keyboardType: TextInputType.text),
                spacer(),
                heading('PRICE'),
                CustomTextField(
                    hintText: 'A suitable price for the product',
                    controller: productPrice,
                    keyboardType: TextInputType.number),
                spacer(),
                CustomButton(
                  title: 'Add',
                  onTap: () {
                    _cubit.addProduct(productName.text, productDesc.text,
                        int.parse(productPrice.text),imagePath);
                  },
                  gradientColors: const [Colors.yellowAccent, Colors.white],
                ),
                spacer(),
              ],
            ),
          ),
          if (isLoading)
            BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: isLoading ? 5 : 0,
                  sigmaY: isLoading ? 5 : 0,
                ),
                child:
                const Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }

  Widget AddProductImage() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [AppColors.cardPrimary, Colors.black],
          ),
        ),
        height: 100,
        width: 100,
        child: _image == null
            ? InkWell(
          onTap: showOptions,
              child: const Center(
                  child: Icon(Icons.add),
                ),
            )
            : Image.file(
                _image!,
                fit: BoxFit.contain,
              ),
      );

  Future showOptions() async {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: getImageFromCamera,
                      child: ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text("Click a picture",
                              style: AppTextStyle.smallHeading))),
                  Divider(),
                  InkWell(
                      onTap: getImageFromGallery,
                      child: ListTile(
                          leading: Icon(Icons.file_copy_outlined),
                          title: Text("Pick from Gallery",
                              style: AppTextStyle.smallHeading))),
                ],
              ),
        ));
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        isLoading = true;
      });
      imagePath = await _cubit.uploadImageGetId(_image!);
      setState(() {
        isLoading = false;
      });
    }
    Navigator.pop(context);
  }

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
    setState(() {
        _image = File(pickedFile.path);
        isLoading = true;
    });
    imagePath = await _cubit.uploadImageGetId(_image!);
    setState(() {
      isLoading = false;
    });
    }
    Navigator.pop(context);
  }


}



Widget heading(String value) => Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        value,
        style: AppTextStyle.smallHeading,
      ),
    );

Widget spacer() => const SizedBox(height: 20);
