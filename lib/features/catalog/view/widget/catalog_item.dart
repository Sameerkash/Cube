import 'package:cube/common_utils/colors.dart';
import 'package:cube/common_utils/text_style.dart';
import 'package:cube/features/catalog/models/catalog_object.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  CatalogItem({Key? key,required this.data,required this.index}) : super(key: key);

  CatalogItemData? data;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [(index % 2 == 0) ? Colors.yellowAccent : AppColors.cardBackground,Colors.white],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(data?.description ?? 'https://firebasestorage.googleapis.com/v0/b/cube-4d453.appspot.com/o/productImages%2Fdata%2Ffallback.jpeg?alt=media&token=fa6299ae-0ed7-4b68-b019-83c2d3ac5c31&_gl=1*44r6wu*_ga*MjMyMTQ3MTI1LjE2OTYwOTY1MDI.*_ga_CW55HF8NVT*MTY5NzU3NTM0OC4yMC4xLjE2OTc1NzY4ODEuMTYuMC4w',height: 100,width: 100,),
              ),
              Text(data?.name ?? "Coral Pink",style: AppTextStyle.smallHeading.copyWith(color: (index % 2 == 0) ? Colors.black : Colors.white),),
              Text("Rs.${(data?.variations[0]?.itemVariationData?.priceMoney?.amount ?? 24).toString()}",style: AppTextStyle.subHeading.copyWith(color: (index % 2 == 0) ? Colors.black : Colors.white,fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}
