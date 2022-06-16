import 'package:flutter/cupertino.dart';
import 'package:movie_task/data/models/crew_cast_model.dart';
import 'package:movie_task/data/services/components/remote/dio_helper.dart';
import 'package:movie_task/data/services/components/remote/url.dart';

class MovieCrewAndCastProvider extends ChangeNotifier{
  CrewAndCastModel? crewAndCastModel;


  Future<CrewAndCastModel?> getCrewCast(int movieId) async{
    try{
      await DioHelper.getData(url: "/movie/$movieId/credits", query: {
        "api_key": Url.apiKey,
      }).then((value) {
        print(value.data);
        crewAndCastModel = CrewAndCastModel.fromJson(value.data);

      });
    }catch(e){
      print(e.toString());
    }
    notifyListeners();
    return crewAndCastModel;

  }
}