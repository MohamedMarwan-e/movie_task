import 'package:flutter/cupertino.dart';
import 'package:movie_task/data/models/person_details_model.dart';
import 'package:movie_task/data/models/person_images_model.dart';
import 'package:movie_task/data/services/components/remote/dio_helper.dart';
import 'package:movie_task/data/services/components/remote/url.dart';

class PersonDetailsProvider extends ChangeNotifier{
  PersonDetailsModel? personDetailsModel;
  PersonImagesModel? personImagesModel;

  Future<PersonDetailsModel?> getPersonDetails(int personId) async{
    try{
      await DioHelper.getData(url: "/person/$personId",
       query: {
        "api_key": Url.apiKey,
      }).then((value) {
        print(value.data);
        personDetailsModel = PersonDetailsModel.fromJson(value.data);

      });
    }catch(e){
      print(e.toString());
    }
    notifyListeners();
    return personDetailsModel;
  }


  Future<PersonImagesModel?> getPersonImages(int personId) async{
    try{
      await DioHelper.getData(url: "/person/$personId/images", query: {
        "api_key": Url.apiKey,
      }).then((value) {
        print(value.data);
        personImagesModel = PersonImagesModel.fromJson(value.data);

      });
    }catch(e){
      print(e.toString());
    }
    notifyListeners();
    return personImagesModel;

  }
}