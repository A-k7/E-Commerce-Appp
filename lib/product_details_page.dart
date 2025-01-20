import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product
    });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  int selectedsize = 0 ;

  void onTap(){
    if(selectedsize != 0){
    Provider.of<CartProvider>(context,listen: false).Addtocart({
    'id': widget.product['id'],
    'title': widget.product['title'],
    'price': widget.product['price'],
    'imageUrl': widget.product['imageUrl'],
    'company': widget.product['company'],
    'size': selectedsize,
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Succesfully Added")));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select a size")));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        ),
      body: Column(
        children: [
          Text(widget.product['title'] as String , style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${widget.product['price']}',style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length ,
                    itemBuilder:  (context, index) {
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedsize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor: size==selectedsize? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                            label:Text('$size') ),
                        ),
                      );
                    } ,),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize:  const Size(double.infinity,50),
                  ),
                  icon: Icon(Icons.shopping_cart_sharp,color: Colors.black,), 
                  label:  const Text('Add to Cart',style: TextStyle(fontSize: 18,color: Colors.black),),
                  ),
                )
              ],
            ),
            )
        ],
      ),
    );
  }
}