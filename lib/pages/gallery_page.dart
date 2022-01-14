import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movieTest/controller/gallery_controller.dart';
import 'package:movieTest/shared_value.dart';
import 'package:photo_view/photo_view.dart';

class GalleryPage extends StatefulWidget {

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final GalleryController galleryController = Get.find();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Gallery",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.deepPurple,
            tabs: [
              Tab(text: "BACKDROPS",),
              Tab(text: "POSTERS",),
            ],
          ),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
          elevation: 1,
        ),
        body: TabBarView(
          children: [
            Obx(
            ()=> Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: galleryController.backdropList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Get.dialog(Container(
                            child: PhotoView(
                              imageProvider: NetworkImage("$baseURLImages${galleryController.backdropList[index].filePath}"),
                            )
                        ));
                      },
                      child: ClipRRect(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 270,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "$baseURLImages${galleryController.backdropList[index].filePath}",
                                  ),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.fit(1),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
              ),
            ),
            Obx(
              ()=> Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: galleryController.posterList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Get.dialog(Container(
                            child: PhotoView(
                              imageProvider: NetworkImage("$baseURLImages${galleryController.posterList[index].filePath}"),
                            )
                        ));
                      },
                      child: ClipRRect(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 270,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "$baseURLImages${galleryController.posterList[index].filePath}",
                                  ),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.fit(1),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
