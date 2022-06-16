import 'package:flutter/material.dart';
import 'package:movie_task/controller/home_provider.dart';
import 'package:movie_task/controller/movie_crew_cast_provider.dart';
import 'package:movie_task/controller/person_details_provider.dart';
import 'package:movie_task/services/components/remote/dio_helper.dart';
import 'package:movie_task/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(
      MultiProvider(
          providers: [
           ChangeNotifierProvider(create: (context) => HomeProvider()),
           ChangeNotifierProvider(create: (context) => MovieCrewAndCastProvider()),
           ChangeNotifierProvider(create: (context) => PersonDetailsProvider()),
          ],
       child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}


