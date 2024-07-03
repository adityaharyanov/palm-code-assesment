import 'package:get/get.dart';
import 'package:palm_code_assessment/presentations/pages/detail_page/detail_page.dart';
import 'package:palm_code_assessment/presentations/pages/home_page/home_page.dart';
import 'package:palm_code_assessment/presentations/pages/likes_page/likes_pages.dart';

enum RouteName {
  home(path: "/"),
  detail(path: "/detail"),
  likes(path: "/likes"),
  ;

  final String path;

  const RouteName({required this.path});
}

class AppRoute {
  static List<GetPage<dynamic>> get pages {
    return [
      GetPage(
        name: RouteName.home.path,
        page: () => HomePage(),
      ),
      GetPage(
        name: RouteName.detail.path,
        page: () => DetailPage(),
      ),
      GetPage(
        name: RouteName.likes.path,
        page: () => LikesPage(),
      ),
    ];
  }
}
