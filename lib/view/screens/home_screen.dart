import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_task/controller/home_provider.dart';
import 'package:movie_task/data/models/popular_movie_model.dart';
import 'package:movie_task/view/screens/movie_crew_cast_screen.dart';
import 'package:movie_task/view/widgets/custom_image.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget{
 const HomeScreen({Key? key}) : super(key: key);

 @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PagingController<int, Result> pagingController = PagingController(firstPageKey: 1);
  final int pageSize = 1;
  bool servicesLoader = false;
  Future<void> servicesFuture({required int pageKey}) async {
    servicesLoader = true;
    try {
      var data = await Provider.of<HomeProvider>(context, listen: false).popularMovie(pageKey);
      if (data != null) {
        List<Result> adds = data.results!;
        if (pageKey == 1) {
          pagingController.itemList = [];
        }
        final isLastPage = adds.length < pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(adds);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(adds, nextPageKey);
        }
      }
      servicesLoader = false;
    } catch (e) {
      servicesLoader = false;
      rethrow;
    }
  }

  @override
  void initState()  {
    servicesFuture(pageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      servicesFuture(pageKey: pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
     final ref = Provider.of<HomeProvider>(context);
     return Scaffold(
      body: servicesLoader || ref.popularMovieModel == null ?
          const Center(child: CircularProgressIndicator()) :
          SafeArea(
            child: PagedListView<int, Result>(
              pagingController: pagingController,
              padding: const EdgeInsets.only(bottom: 30),
              shrinkWrap: true,
              builderDelegate: PagedChildBuilderDelegate<Result>(
                noItemsFoundIndicatorBuilder: (context) => const Text('No Item Found'),
                firstPageProgressIndicatorBuilder: (_) => const CircularProgressIndicator(),
                itemBuilder: (context, item, index) => SizedBox(
                  width: media.width ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieCrewAndCastScreen(id: item.id!)));
                    },
                    child: CustomImage(
                      "http://image.tmdb.org/t/p/w500${item.backdropPath}",
                      height: 200,
                      horizontal: media.width * 0.029,
                      radius: 10,
                      isShadow: true,
                    ),
                  ),
                  ),
              ),
            ),
          )
    );
  }
  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}