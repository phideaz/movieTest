import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieTest/models/movie.dart';
import 'package:movieTest/services/movie_list_services.dart';

class HomeController extends GetxController{
  var searchFilm = TextEditingController().obs;
  var searchValue = "".obs;
  var movieList = <Movie>[].obs;
  var allMovieFetch = <Movie>[].obs;

  @override
  void onInit() {
    fetchMovies();
    ever(searchValue, (_){
      searchMovies();
    });
    super.onInit();

  }

  void fetchMovies() async{
    try {
      var data = await MovieListService.getMovieList();

      var result = data['results'];

      if (result != null) {
        var dataMovie = data['results'] as List;
        List<Movie> list = dataMovie.map((e) => Movie.fromJson(e)).toList();

        allMovieFetch.value = list;
        movieList.value = list;

      } else {
      }
    } catch(e) {
      print(e.toString());
    }

  }
  void searchMovies() async{
    List<Movie> tempList = [];
    for(int i = 0; i < allMovieFetch.length; i++){
      if(allMovieFetch[i].title.toString().toLowerCase().contains(searchValue.toString().toLowerCase())){
        tempList.add(allMovieFetch[i]);
      }
    }
    movieList.value = tempList;

  }
}