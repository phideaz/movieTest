import 'package:get/get.dart';
import 'package:movieTest/models/backdrop.dart';
import 'package:movieTest/services/gallery_services.dart';

class GalleryController extends GetxController{

  var backdropList = <Backdrop>[].obs;
  var posterList = <Backdrop>[].obs;

  void fetchGallery(int id) async{
    try {
      var data = await GalleryServices.getGallery(id);
      print("DATA Gallery : " + data.toString());

      var result = data;

      if (result != null) {
        var dataBackdrop = data['backdrops'] as List;
        List<Backdrop> listBackdrop = dataBackdrop.map((e) => Backdrop.fromJson(e)).toList();
        backdropList.value = listBackdrop;

        var dataPosters = data['posters'] as List;
        List<Backdrop> listPosters = dataPosters.map((e) => Backdrop.fromJson(e)).toList();
        posterList.value = listPosters;
      } else {
      }
    } catch(e) {
      print(e.toString());
    }

  }

}