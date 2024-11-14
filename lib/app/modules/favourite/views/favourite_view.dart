import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favourite_controller.dart';
import 'package:agape_s_application1/widgets/custom_bottom_bar.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bidhaa Pendwa'),
        centerTitle: true,
      ),
       body:  SingleChildScrollView(
         child: Padding(
          padding: EdgeInsets.all(8.0),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height:191 ,
                  width: 170,
                  child: Container(
                    child: Column(
                      children: [
                       Image.asset('assets/images/img_84439dcd_10ef_4.png',fit: BoxFit.scaleDown),
                       SizedBox(height: 10,),
                        Text("Alitop,Subwoofer",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Tsh 115,0000",style: TextStyle(fontWeight:FontWeight.w400))
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                SizedBox(
                  height:191 ,
                  width: 170,
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset("assets/images/img_84439dcd_10ef_4.png"),
                        SizedBox(height: 10,),
                        Text("Alitop,Subwoofer",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Tsh 115,0000",style: TextStyle(fontWeight:FontWeight.w400),),
                      ],
                    ),
                  ),
                )
              ],
            )
            ],
           ),
         ),
       ),
       bottomNavigationBar: CustomBottomBar(),  
    );
  }
}
