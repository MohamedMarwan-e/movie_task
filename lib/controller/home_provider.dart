import 'package:flutter/cupertino.dart';
import 'package:movie_task/data/models/popular_movie_model.dart';
import 'package:movie_task/services/components/remote/dio_helper.dart';
import 'package:movie_task/services/components/remote/url.dart';


class HomeProvider extends ChangeNotifier{
  PopularMovieModel? popularMovieModel;

  Future<PopularMovieModel?> popularMovie(int page) async {
    try{
      await DioHelper.getData(
          url: "/movie/popular",
          query: {
            "api_key": Url.apiKey,
            "page": page,
          }
      ).then((value) {
        print(value.data);
        popularMovieModel =  PopularMovieModel.fromJson(value.data);
      });
    }catch(e){
      print(e.toString());
    }
    notifyListeners();
    return popularMovieModel ;
  }

}