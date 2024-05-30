import 'package:flash_chat/Models/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utilities/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return CartItemsWidget();
  }
}

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [


            // top container with cart text
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 110,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                    color: KPrimaryColor,
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                    child: Text(
                      'Cart items',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 20,),


            // cart items
            Expanded(
              child: ListView.separated(

                scrollDirection: Axis.vertical,
                itemCount: Provider.of<ItemModel>(context).cartItems.length,
                itemBuilder: (context , index){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.grey[100] ,
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(

                              children: [
                                // image and description and price
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // image
                                    Image.asset(Provider.of<ItemModel>(context).cartItems[index].imagePath),


                                    // item name
                                    Text(
                                      Provider.of<ItemModel>(context).cartItems[index].itemName,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    // price
                                    Text(
                                      Provider.of<ItemModel>(context).cartItems[index].price,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),

                                  ],


                                ),

                                const SizedBox(height: 17,),

                                //Button to remove item from cart
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      print('here');
                                      Provider.of<ItemModel>(context , listen: false).deleteItemFromCart(index);
                                    },
                                    child: Material(
                                      elevation:10 ,
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: KPrimaryColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Remove From Cart ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },


                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
