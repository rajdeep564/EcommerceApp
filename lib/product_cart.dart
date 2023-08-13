import 'package:flutter/material.dart';
class ProductCart extends StatelessWidget {
  final String tittle ;
  final double price;
  final String image;
  const ProductCart({
    super.key,
    required this.tittle,
    required this.price,
    required this.image,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const  Color.fromRGBO(216, 240, 253, 1),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tittle,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5),
          Text('\$$price',style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 5),
          Center(child: Image.asset(image,height: 175,)),
          
         
        ],
      ),
    );
  }
}