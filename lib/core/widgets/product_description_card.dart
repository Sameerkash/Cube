import 'package:flutter/material.dart';

import 'package:cube/core/widgets/arrow_icon.dart';

class ProductDescriptionCard extends StatelessWidget {
  final List<Color> gradientColors;
  final String title;
  final String? description;
  final double? width;
  final bool showArrow;
  const ProductDescriptionCard({
    Key? key,
    required this.gradientColors,
    required this.title,
    this.description,
    this.width,
    this.showArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      child: InkWell(
        onTap : () {
          showFullContext(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          width: width,
          constraints: const BoxConstraints(
            minHeight: 220,
          maxHeight: 500,),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (description != null)
                      Text(
                        description!,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),if (showArrow)
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ArrowIcon()],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showFullContext(BuildContext context) {
    showModalBottomSheet(context: context,
        // isScrollControlled: true,
        builder: (context) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              gradient: LinearGradient(colors: gradientColors),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (description != null)
                      Text(
                        description!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(onPressed: () {
              Navigator.of(context).pop();
            }, icon: Icon(Icons.close,color: Colors.black,)),
          )
        ],
      );
    });
  }
}
