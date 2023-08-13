import 'package:ecommerce_app/Cart_provider.dart';
import 'package:ecommerce_app/globalvariable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
    });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int Selectedsize = 0;

  void onTap(){
    if(Selectedsize != 0){
       Provider.of<CartProvider>(context,listen: false)
          .addproduct(
            {
             'id': widget.product['id'],
            'title':  widget.product['title'],
            'price':  widget.product ['price'],
            'imageUrl':  widget.product ['imageUrl'],
            'company': widget.product['company'],
            'size': Selectedsize}

          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please added sucessfully")));

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Select a size")));
    }
         
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const  Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(widget.product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              color:  Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40), // Curved top-left corner
      topRight: Radius.circular(40), // Curved top-right corner
    ),
              
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${widget.product['price']}',
                style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                SizedBox(
      
                  height: 50,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context,index) {
                      final size =(widget.product['sizes'] as List<int>)[index];
                
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Selectedsize = size;
                            });
                          },
                          child: Chip(label: Text(size.toString(),),
                          backgroundColor: Selectedsize == size ? Theme.of(context).colorScheme.primary:null,
                          ),
                        ),
                      );
                    }),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                  
                    onPressed:onTap, 
                  child:   const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart,color: Colors.black,),
                       SizedBox(width: 8,),
                      Text("ADD TO CART",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),)
                    ],
                  ),
                  
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                    elevation: 3,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: const Size(double.infinity, 50),

                  ),),
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}