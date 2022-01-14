import 'package:get/get.dart';
import 'package:movieTest/pages/detail_movie_page.dart';
import 'package:movieTest/pages/gallery_page.dart';
import 'package:movieTest/pages/home_page.dart';
import 'package:movieTest/route/route_name.dart';

class PagesRoute {
  static final pages = [
    GetPage(name: RouteName.home, page: ()=>HomePage()),
    GetPage(name: RouteName.detailMovie, page: ()=>DetailMoviePage()),
    GetPage(name: RouteName.gallery, page: ()=>GalleryPage()),
  ];
}