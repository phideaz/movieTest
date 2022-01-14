import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieTest/controller/gallery_controller.dart';
import 'package:movieTest/controller/movie_detail_controller.dart';
import 'package:movieTest/route/route_name.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared_value.dart';

class DetailMoviePage extends StatelessWidget {
  final MovieDetailController movieController = Get.find();
  final GalleryController galleryController = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
              ()=> movieController.movieDetail.length > 0 ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("$baseURLImages${movieController.movieDetail[0].posterPath}"
                    ),
                    fit: BoxFit.cover
                  )
                ),
              ): SizedBox(),
            ),
            Positioned(
                left: 8,
                top: 8,
                child: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(
              Icons.arrow_back,
              size: 24,
                color: Colors.white,
            ),)),
            Positioned(
              bottom: 0,
                child: Obx(
                  ()=> Container(
                    height: MediaQuery.of(context).size.height/1.65,
                    color: Colors.transparent,
              margin: EdgeInsets.symmetric(horizontal: 22),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 28),
                          width: MediaQuery.of(context).size.width-32,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24)),
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: movieController.movieDetail.length > 0 ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 28,
                                  ),
                                  Text(
                                    "${movieController.movieDetail[0].title}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Divider(
                                    height: 26,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.today,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${movieController.movieDetail[0].releaseDate.toString().substring(0,4)}",
                                          style: TextStyle(
                                              fontSize: 14,
                                            color: Colors.black54
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.language,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: (){
                                            launch("${movieController.movieDetail[0].homepage}");
                                          },
                                          child: Text(
                                            "${movieController.movieDetail[0].homepage}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueAccent
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_city,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Text(
                                          movieController.productions.value,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 26,
                                  ),
                                  Text(
                                    "TAGLINE",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Obx(
                                    ()=> Text(
                                      movieController.movieDetail[0].tagline,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                      ),
                                    ),
                                  )
                                ],
                              ) : SizedBox(),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: (){
                              galleryController.fetchGallery(movieController.movieDetail[0].id);
                              Get.toNamed(RouteName.gallery);
                            },
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.teal
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
                ))
          ],
        ),
      ),
    );
  }
}
