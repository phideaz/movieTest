import 'package:get/get.dart';
import 'package:movieTest/models/movie_detail.dart';
import 'package:movieTest/services/movie_detail_services.dart';

class MovieDetailController extends GetxController{

  var movieDetail = <MovieDetail>[].obs;
  var productions = "".obs;

  void fetchDetailMovie(int id) async{
    movieDetail.clear();
    productions.value = "";
    print("ID MOVIE : $id");
    try {
      var data = await MovieDetailService.getDetailService(id);
      print("DATA Detail Movies : " + data.toString());

      var result = data;

      if (result != null) {
        var dataMovie = data;
        movieDetail.add(MovieDetail.fromJson(dataMovie));
        if(movieDetail.length > 0){
          for(int i = 0; i < movieDetail[0].productionCompanies.length; i++){
            if(i == movieDetail[0].productionCompanies.length-1){
              productions.value = productions.value + movieDetail[0].productionCompanies[i].name;
            }else{
              productions.value = productions.value + movieDetail[0].productionCompanies[i].name + ", " ;

            }
          }
        }
      } else {
        print("GAGAL");
      }
    } catch(e) {
      print(e.toString());
    }

  }


}