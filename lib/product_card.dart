import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundcolor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundcolor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 10,),
          Text("$price",style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 10,),
          Center(
            child: Image(image: AssetImage(image),
            height: 250,),
          )
        ],
      ),
    );
  }
}