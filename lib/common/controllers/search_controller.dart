import 'package:garden_of_eve/utils/utils.dart';

class SearchController extends GetxController {
  String searchKey = '';

  set setSearchKey(String val) => searchKey = val;

  String get getSearchKey => searchKey;
}
