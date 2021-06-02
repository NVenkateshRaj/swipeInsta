import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class Food{
 final String name;
  final Icon icon;
  final String rate;
  final String desc;
  final Color color;

 Food({this.name, this.icon, this.rate, this.desc,this.color});
 
}
List<Food> foodList = [
  Food(color: Color(0xFF3A3BBE), name: "Cafe & Drinks", icon: Icon(CommunityMaterialIcons.coffee,color: Colors.black,size: 110,)),
  Food(color: Color(0xFFFFCB9B),name: "Food & Beverages",icon: Icon(CommunityMaterialIcons.food,color: Colors.black,size: 110)),
  Food(color: Color(0xFFFF7980),name: "Hospital",icon: Icon(CommunityMaterialIcons.hospital,color: Colors.black,size: 110) ),
  Food(color: Color(0xFF9C8BFF),name: "Travelling",icon: Icon(CommunityMaterialIcons.bus,color: Colors.black,size: 110)),
  Food(color: Color(0xFF47D187),name: "Bills",icon: Icon(CommunityMaterialIcons.receipt,color: Colors.black,size: 110) ),
  Food(color: Color(0xFF2684FF),name: "Subscriptions",icon: Icon(CommunityMaterialIcons.youtube_subscription,color: Colors.black,size: 110)),
  Food(color: Color(0xFFFF7980),name: "Shopping",icon: Icon(CommunityMaterialIcons.shopping,color: Colors.black,size: 110)),
  Food(color: Color(0xFF3A3BBE), name: "Cafe & Drinks", icon: Icon(CommunityMaterialIcons.coffee,color: Colors.black,size: 110)),
  Food(color: Color(0xFFFFCB9B),name: "Food & Beverages",icon: Icon(CommunityMaterialIcons.food,color: Colors.black,size: 110)),
  Food(color: Color(0xFFFF7980),name: "Hospital",icon: Icon(CommunityMaterialIcons.hospital,color: Colors.black,size: 110),),
  Food(color: Color(0xFFFF7980),name: "Hospital",icon: Icon(CommunityMaterialIcons.hospital,color: Colors.black,size: 110) ),
  Food(color: Color(0xFF9C8BFF),name: "Travelling",icon: Icon(CommunityMaterialIcons.bus,color: Colors.black,size: 110)),
  Food(color: Color(0xFF47D187),name: "Bills",icon: Icon(CommunityMaterialIcons.receipt,color: Colors.black,size: 110) ),
  Food(color: Color(0xFF2684FF),name: "Subscriptions",icon: Icon(CommunityMaterialIcons.youtube_subscription,color: Colors.black,size: 110)),
];
