import 'package:flutter/material.dart';
import 'package:movie_task/controller/person_details_provider.dart';
import 'package:movie_task/data/models/person_details_model.dart';
import 'package:movie_task/view/screens/image_screen.dart';
import 'package:movie_task/view/widgets/custom_image.dart';
import 'package:movie_task/view/widgets/custom_text.dart';
import 'package:movie_task/view/widgets/person_image_widget.dart';
import 'package:provider/provider.dart';

class PersonDetailsScreen extends StatelessWidget{
  final int id;
  PersonDetailsScreen({Key? key, required this.id}) : super(key: key);

  PersonDetailsModel? personDetailsModel;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final ref = Provider.of<PersonDetailsProvider>(context,listen: false);

    return Scaffold(
      body: FutureBuilder<PersonDetailsModel?>(
          future: ref.getPersonDetails(id),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            personDetailsModel =snapshot.data;
             return SafeArea(
               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailScreen(image: "http://image.tmdb.org/t/p/w500${ref.personDetailsModel!.profilePath}")));
                           },
                           child: CustomImage(
                             "http://image.tmdb.org/t/p/w500${ref.personDetailsModel!.profilePath}",
                             width: media.width * 0.44,
                             height: 200,
                             horizontal: media.width * 0.029,
                             radius: 10,
                             isShadow: true,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 20),
                           child: Column(
                             crossAxisAlignment:CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               ref.personDetailsModel!.name == null?
                               const SizedBox.shrink():
                               CustomText(
                                 text: "${ref.personDetailsModel!.name}",
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black,
                                 fontSize: 16,
                               ),
                               const SizedBox(height: 5),
                               const CustomText(
                                 text: "Personal Info ",
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black,
                                 fontSize: 16,
                               ),
                               const SizedBox(height: 10),
                               ref.personDetailsModel!.knownForDepartment == null?
                               const SizedBox.shrink():
                               CustomText(
                                 width: media.width * 0.5,
                                 text: "Known For : ${ref.personDetailsModel!.knownForDepartment}",
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black,
                                 fontSize: 12,
                               ),
                               ref.personDetailsModel!.gender == null ?
                               const SizedBox.shrink():
                               CustomText(
                                 text:
                                 ref.personDetailsModel!.gender == 2 ?
                                 "Gender : Male":
                                 "Gender : Female",
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black,
                                 fontSize: 12,
                               ),
                               ref.personDetailsModel!.birthday == null?
                               const SizedBox.shrink():
                               CustomText(
                                 text: "Birthday : ${ref.personDetailsModel!.birthday}".substring(0,21),
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black,
                                 fontSize: 12,
                               ),
                               ref.personDetailsModel!.placeOfBirth == null ?
                               const SizedBox.shrink():
                               CustomText(
                                 width: media.width * 0.49,
                                 text: "Place of Birth : ${ref.personDetailsModel!.placeOfBirth}",
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black,
                                 fontSize: 12,
                               ),

                               ref.personDetailsModel!.alsoKnownAs!.isEmpty || ref.personDetailsModel!.alsoKnownAs == null?
                               const SizedBox.shrink():
                               const CustomText(
                                 text: "Also Known As ",
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black,
                                 fontSize: 12,
                               ),
                               ref.personDetailsModel!.alsoKnownAs!.isEmpty || ref.personDetailsModel!.alsoKnownAs == null?
                               const SizedBox.shrink():
                               SizedBox(
                                 width: media.width * 0.4,
                                 //height: media.height * 0.2,
                                 child: ListView.builder(
                                     shrinkWrap: true,
                                     itemCount: ref.personDetailsModel!.alsoKnownAs!.length,
                                     itemBuilder: (context,index){
                                       return CustomText(
                                         text: ref.personDetailsModel!.alsoKnownAs![index],
                                         fontWeight: FontWeight.w600,
                                         color: Colors.black,
                                         fontSize: 12,
                                       );
                                     }),
                               )

                             ],
                           ),
                         )
                       ],
                     ),
                     ref.personDetailsModel!.biography == null ||  ref.personDetailsModel!.biography == ""?
                     const SizedBox.shrink():
                     const Padding(
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       child: CustomText(
                         text: "Biography",
                         fontWeight: FontWeight.w600,
                         color: Colors.black,
                         fontSize: 16,
                       ),
                     ),
                     const SizedBox(height: 10),
                     ref.personDetailsModel!.biography == null?
                     const SizedBox.shrink():
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                       child: CustomText(
                         text: ref.personDetailsModel!.biography,
                         fontWeight: FontWeight.normal,
                         color: Colors.black,
                         fontSize: 12,
                       ),
                     ),
                     PersonImageWidget(id:id),
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