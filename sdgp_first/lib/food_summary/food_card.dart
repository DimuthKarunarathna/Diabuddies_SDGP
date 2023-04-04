import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_first/food_summary/food_entity.dart';

class FoodCard extends StatelessWidget {
  final FoodEntity entity;
  const FoodCard({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15,left: 5,right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text("Calories: ${entity.calories}"),
                Text("Protein: ${entity.protein}"),
                Text("Fats: ${entity.fats}"),
                Text("Carbs: ${entity.carbs}"),
                Text("Fiber: ${entity.fiber}"),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${entity.time}"),
                    Text("        "),
                    Text("${entity.date}")

                  ],
                ),
                SizedBox(height: 25,),
                Text("Before BGL: ${entity.bglBefore}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                SizedBox(
                  height: 3,
                ),
                Text("After BGL: ${entity.bglAfter}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15))
              ],
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(129, 255, 255, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)
          )
      ),
    );
  }
}
