import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
  
}
class HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
              direction: Axis.horizontal,
              children:List.generate(6 , (index) {
                return Container(
                  width:  media.width * 0.44,
                  height: media.height * 0.4,
                  margin: EdgeInsets.symmetric(horizontal: media.width * 0.029,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green,
                  ),

                );
               }
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
  
}