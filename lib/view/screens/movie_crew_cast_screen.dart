import 'package:flutter/material.dart';
import 'package:movie_task/controller/movie_crew_cast_provider.dart';
import 'package:movie_task/core/helper/colors.dart';
import 'package:movie_task/data/models/crew_cast_model.dart';
import 'package:movie_task/view/screens/person_details_screen.dart';
import 'package:movie_task/view/widgets/custom_image.dart';
import 'package:movie_task/view/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MovieCrewAndCastScreen extends StatelessWidget{

  final int id;
  MovieCrewAndCastScreen({super.key, required this.id});
  CrewAndCastModel? crewAndCastModel;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final ref = Provider.of<MovieCrewAndCastProvider>(context,listen: false);


    return Scaffold(
      body:  FutureBuilder<CrewAndCastModel?>(
        future: ref.getCrewCast(id),
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          crewAndCastModel = snapshot.data ;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "Crew",
                      fontSize: 16,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Wrap(
                    direction: Axis.horizontal,
                    children:List.generate(ref.crewAndCastModel!.crew!.length , (index) {
                      return
                        ref.crewAndCastModel!.crew![index].profilePath == null?
                        const SizedBox.shrink():
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PersonDetailsScreen(id: ref.crewAndCastModel!.crew![index].id!)));

                          },
                          child: CustomImage(
                            "http://image.tmdb.org/t/p/w500${ref.crewAndCastModel!.crew![index].profilePath}",
                            width: media.width * 0.44,
                            height: 200,
                            horizontal: media.width * 0.029,
                            radius: 10,
                            isShadow: true,
                          ),
                        );
                    }
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "Cast",
                      fontSize: 14,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Wrap(
                    direction: Axis.horizontal,
                    children:List.generate(ref.crewAndCastModel!.cast!.length , (index) {
                      return
                        ref.crewAndCastModel!.cast![index].profilePath == null?
                        const SizedBox.shrink():
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PersonDetailsScreen(id: ref.crewAndCastModel!.cast![index].id!)));

                          },
                          child: CustomImage(
                            "http://image.tmdb.org/t/p/w500${ref.crewAndCastModel!.cast![index].profilePath}",
                            width: media.width * 0.44,
                            height: 200,
                            horizontal: media.width * 0.029,
                            radius: 10,
                            isShadow: true,
                          ),
                        );
                    }
                    ),
                  )
                ],
              ),
            ),
          );
          }
          return const Center(child:CircularProgressIndicator());
         }
        ),
    );
  }
  
}