import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filter = ['All','Addidas','Nike','Puma','Rebok'];
  late String selectedfilter ;
    @override
  void initState() {
    super.initState();
    selectedfilter = filter[0];

  }
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)));
    return SafeArea(
        child: Column(
        children: [
           Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Shoes\nCollection",style: Theme.of(context).textTheme.titleLarge,),
              ),
              const Expanded(
              child: TextField(decoration: InputDecoration(
                hintText: "search",
                prefixIcon: Icon(Icons.search),
                border: border,
                enabledBorder: border,
                focusedBorder: border )))
            ],  
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index){
                final fil=filter[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedfilter = fil;
                      });
                    },
                    child: Chip(
                      side: const BorderSide(color:  Color.fromRGBO(245, 247, 249, 1)),
                      labelStyle: const TextStyle(fontSize: 16) ,
                      backgroundColor: selectedfilter==fil ? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,
                      label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
                      child: Text(fil),
                    )),
                  ),
                );
              } ,
            ),
          ),
          Expanded(
            child: ListView.builder(itemCount: products.length ,itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return ProductDetailsPage(product: product);
                  } ));
                },
                child: ProductCard(
                  title: product['title'] as String,
                  price: product['price'] as double ,
                  image:product['imageUrl'] as String,
                  backgroundcolor: index.isEven ? Colors.blue.shade100 : const Color.fromRGBO(245, 247, 249, 1),),
              );
            },
              ),
          )
        ],
      ));
  }
}