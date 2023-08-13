import 'package:flutter/material.dart';
import 'globalvariable.dart';
import 'package:ecommerce_app/product_cart.dart';
import 'package:ecommerce_app/product_details.dart';
class ProductList extends StatefulWidget {
   
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'ALL',
    'NIKE',
    'ADIDAS',
    'ASIAN',
    'GO 21'
  ];
  late String selectedFilter;

   @override
  void initState() {
    // TODO: implement initState
    
    selectedFilter=filters[0];
  }

  @override
  Widget build(BuildContext context) {
     const border = OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(225, 225, 225, 1),
                  ),
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                );
    return SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                 Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Shoes\nCollection',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                      
                            ),
                            ),
                ),
             Expanded(child: TextField(
              decoration: InputDecoration(
                border:border ,
                focusedBorder: border,
                hintText: 'search',
                prefixIcon: Padding(
                  padding:  EdgeInsets.fromLTRB(15, 0, 0,0),
                  child: Icon(Icons.search,),
                ),
              ),
            ),
            ),
            ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder:(context,index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal :8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                           selectedFilter = filter;
                        });
                       
                      },
                      child: Chip(
                        backgroundColor : selectedFilter == filter
                        ? Theme.of(context).colorScheme.primary 
                        :const  Color.fromRGBO(245, 247, 249, 1),
                         label: Text(filter,),
                         side: const BorderSide(
                          color:  Color.fromRGBO(245, 247, 249, 1),
                          
                         ),
                      
                      labelStyle: const TextStyle(
                        fontSize: 15,
                                      
                      ),
                      padding: const EdgeInsets.symmetric(vertical:15,horizontal: 20
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30) 
                        ),
                      ),
                    ),
                  );
                },
                ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ProductDetailsPage(product: product);
                      }));
                    },
                    child: ProductCart(
                      tittle :product['title'] as String,
                      price : product['price'] as double,
                      image : product['imageUrl'] as String,
                      ),
                  );
            
              },),
            ),
            
          ],
          
        ),
      );
  }
}