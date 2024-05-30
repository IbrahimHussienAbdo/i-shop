import 'package:flash_chat/Models/ItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/Item.dart';
import 'constants.dart';

class Button extends StatelessWidget {
  final Color color ;
  final String buttontext ;
  final VoidCallback onpressed ;
  const Button({super.key, required this.color, required this.buttontext, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        height: 65,

        child: Material(
          elevation: 5.0,
          color: color ,
          borderRadius: BorderRadius.circular(10.0),
          child: MaterialButton(
            onPressed: onpressed,
            // Navigator.pushNamed(context, LoginScreen.id); ,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              buttontext ,
              style:  TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),

          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String sectionTitle;

  SectionTitle({super.key, required this.sectionTitle,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            sectionTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:   30,
              color: Colors.black,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class HomeItemTile extends StatelessWidget {

   HomeItemTile({super.key,  required this.imagePath, required this.itemName, required this.price});

   final String imagePath ;
   final String itemName ;
   final String price ;

   void _showPopupMessage(BuildContext context) {
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           icon:  const Icon(
             Icons.bookmark_added_rounded ,
             size: 50,
             color: secondcolor,
           ),
           title: const Text('Item Added to Cart!'),
           actions: <Widget>[
             TextButton(
               onPressed: () {
                 Navigator.of(context).pop();
               },
               child: Text('Got it!'),
             ),
           ],
         );
       },
     );
   }


   @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      height: 230,
      width: 170,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            // image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                  child: Image.asset(imagePath ,height: 140,width: 135, )
              ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                thickness: 2,
              ),
            ),


            const SizedBox(
              height: 20,
            ),



            // description & add to cart button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Text(
                     itemName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GestureDetector(
                  child:  const Icon(CupertinoIcons.cart_badge_plus , size: 30,),
                  onTap: (){
                    // add function (add cart to item )
                    Provider.of<ItemModel>(context,listen: false).addItemToCart(Item(imagePath: imagePath, price: price, itemName: itemName));
                    _showPopupMessage(context);

                  },
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            //price
            Container(
              width: 150,
              height: 30,
              decoration: const BoxDecoration(
                color: secondcolor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child:  Center(
                child: Text(
                  price,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),





          ]
      ),

    );
  }
}



class HomeItemsWidget extends StatelessWidget {
  const HomeItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [



              SectionTitle(sectionTitle: 'bags',),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<ItemModel>(context).BagItems.length,
                    itemBuilder: (context , index){
                      return   HomeItemTile(
                        imagePath: Provider.of<ItemModel>(context).BagItems[index].imagePath ,
                        itemName:  Provider.of<ItemModel>(context).BagItems[index].itemName ,
                        price:  Provider.of<ItemModel>(context).BagItems[index].price ,)
                      ;
                    }

                ),
              ),


              SectionTitle(sectionTitle: 'Clothes',),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<ItemModel>(context).ClothesItems.length,
                    itemBuilder: (context , index){
                      return   HomeItemTile(
                        imagePath: Provider.of<ItemModel>(context).ClothesItems[index].imagePath ,
                        itemName:  Provider.of<ItemModel>(context).ClothesItems[index].itemName ,
                        price:  Provider.of<ItemModel>(context).ClothesItems[index].price ,)
                      ;
                    }

                ),
              ),



              SectionTitle(sectionTitle: 'accessories',),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<ItemModel>(context).AccssoriesItems.length,
                    itemBuilder: (context , index){
                      return   HomeItemTile(
                        imagePath: Provider.of<ItemModel>(context).AccssoriesItems[index].imagePath ,
                        itemName:  Provider.of<ItemModel>(context).AccssoriesItems[index].itemName ,
                        price:  Provider.of<ItemModel>(context).AccssoriesItems[index].price ,)
                      ;
                    }

                ),
              ),





            ],
          ),
        )
      ],
    );
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
                    color: Colors.black,
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
                    padding:  EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 220,
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

                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(Provider.of<ItemModel>(context).cartItems[index].imagePath ,height: 140,width: 135, )
                                    ),




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
                                      (Provider.of<ItemModel>(context , listen: false).deleteItemFromCart(index));
                                    },
                                    child: Material(
                                      elevation:10 ,
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: secondcolor,
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