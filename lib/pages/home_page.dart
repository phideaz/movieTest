import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movieTest/controller/home_controller.dart';
import 'package:movieTest/controller/movie_detail_controller.dart';
import 'package:movieTest/route/route_name.dart';
import 'package:movieTest/widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final movieController = Get.put(MovieDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(
          "TMDb NEW",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            color: Colors.black
          ),
        ),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100]
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 18,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    height: 32,
                    child: Obx(
                      ()=> TextFormField(
                        controller: homeController.searchFilm.value,
                        onChanged: (value){
                          homeController.searchValue.value = value;
                        },
                        style: TextStyle(
                            fontSize: 14
                        ),
                        decoration: InputDecoration(
                          hintText: "Cari Film Disini",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Obx(
                  ()=> Container(
                    child: homeController.searchValue.value != "" ? GestureDetector(
                      onTap: (){
                        homeController.searchFilm.value.clear();
                        homeController.searchValue.value = "";
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black.withOpacity(0.6), width: 1)
                        ),
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      )
                    ) : SizedBox(),
                  ),
                )
              ],
            )
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12, right: 10, top: 0),
              child: Obx(
                    ()=> StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  itemCount: homeController.movieList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieCard(
                      onTap: (){
                        Get.toNamed(RouteName.detailMovie);
                        movieController.fetchDetailMovie(homeController.movieList[index].id);
                      },
                      title: homeController.movieList[index].title,
                      image: homeController.movieList[index].posterPath,
                      dateRelease: homeController.movieList[index].releaseDate.toString().substring(0,4),
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.fit(1),
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 8,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
