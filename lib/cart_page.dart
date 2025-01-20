import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'),) ,
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
        final cartItem =cart[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(cartItem['imageUrl'] as String ),
            radius: 30,
          ),
          trailing: IconButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
              title: Text('Delete Product',style: Theme.of(context).textTheme.titleMedium,),
              content: Text('Are You sure you want to remove product from cart'),
              actions: [
                TextButton(
                  onPressed: (){
                    Provider.of<CartProvider>(context,listen: false).Removeformcart(cartItem);
                    Navigator.of(context).pop();
                    }, 
                  child: Text('Yes',style:TextStyle(color: Colors.red) ,)),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    }, 
                  child: Text('No',style: TextStyle(color: Colors.blue),))
              ],
            );
            });
            
          } ,icon : const Icon(Icons.delete),color: Colors.red,),
          title: Text(cartItem['title'].toString(),style: Theme.of(context).textTheme.bodySmall,),
          subtitle: Text('size : ${cartItem['size']}'),
        );
      }, )
    );
  }
}