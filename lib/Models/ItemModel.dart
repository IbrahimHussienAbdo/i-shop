import 'package:flutter/material.dart';
import 'Item.dart';

class ItemModel extends ChangeNotifier{

  List <Item> BagItems =[
    Item(
      imagePath:'images/bag1.png',
      price: '750 \$' ,
      itemName : 'Black Bag ',
    ),
    Item(
      imagePath:'images/bag2.png',
      price: '1270 \$' ,
      itemName : ' basic bag ',
    ),
    Item(
      imagePath:'images/bag3.png',
      price: '999 \$' ,
      itemName : 'blue bag ',
    ),
  ];
  List <Item> ClothesItems =[
    Item(
      imagePath:'images/clo1.png',
      price: '1700 \$' ,
      itemName : 'black dress ',
    ),
    Item(
      imagePath:'images/clo2.png',
      price: '1450 \$' ,
      itemName : 'flower dress ',
    ),
    Item(
      imagePath:'images/clo3.png',
      price: '1799 \$' ,
      itemName : 'cool dress ',
    ),
  ];
  List <Item> AccssoriesItems =[
    Item(
      imagePath:'images/acc1.png',
      price: '100 \$' ,
      itemName : ' sunglasses ',
    ),
    Item(
      imagePath:'images/acc2.png',
      price: '200 \$' ,
      itemName : 'Neckless ',
    ),
    Item(
      imagePath:'images/acc3.png',
      price: '170 \$' ,
      itemName : 'Earring  ',
    ),
  ];


  List <Item> cartItems =[

  ];


  void addItemToCart(Item){
    cartItems.add(Item);
    notifyListeners();

  }

  void deleteItemFromCart ( int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

}