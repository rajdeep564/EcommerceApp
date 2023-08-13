import 'package:ecommerce_app/Cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //Provider
  //ChangeNotifierProvider
  //FutureProvider
  //SreamProvider

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return  Scaffold(
      appBar:  AppBar(
        title: const Text("CART",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20
        ),),
        centerTitle: true,
      ),
      body: ListView.builder (
        itemCount:cart.length ,
       itemBuilder: (context,index){
        final cartItem = cart[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            radius: 30,
          ),
          trailing: IconButton(onPressed: (){
            showDialog(
              context: context,
             builder: (context){
              return AlertDialog(
                title: Text("Delete Product",
                style: Theme.of(context).textTheme.titleMedium,),
                content: const Text("Are you sure you want to remove your product"),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text("No",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                  ),
                  ),
                  TextButton(onPressed: (){
                    context.read<CartProvider>().removeproduct(cartItem);
                    Navigator.of(context).pop();
                  }, child: const Text("Yes",
                  style: TextStyle(
                    color: Colors.red
                  ),
                  ),
                  ),

                ],
              );
             });
          }, icon: const Icon(Icons.delete),
          color: Colors.red,),
          title: Text(cartItem['title'] as String,
          style: Theme.of(context).textTheme.bodySmall,),
          subtitle: Text('Size:${cartItem['size']}'),
        );
       },
      ),
    );
  }
}