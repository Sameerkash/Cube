import 'package:cube/core/widgets/arrow_icon.dart';
import 'package:flutter/material.dart';

class ProductDescriptionCard extends StatelessWidget {
  final List<Color> gradientColors;
  final String title;
  final String? description;
  final double? width;
  const ProductDescriptionCard({
    Key? key,
    required this.gradientColors,
    required this.title,
    this.description,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
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
          minHeight: 250,
        ),
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
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
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
    );
  }
}
