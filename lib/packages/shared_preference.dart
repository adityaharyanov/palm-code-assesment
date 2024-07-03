import 'dart:convert';

import 'package:palm_code_assessment/data/local_service_interface.dart';
import 'package:palm_code_assessment/data/models/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePackage implements LocalServiceInterface {
  final Future<SharedPreferences> _futureSPref =
      SharedPreferences.getInstance();
  final kFavouritebooks = 'favourite_books';

  @override
  Future toggleFavourite(Book book) async {
    var books = await fetchFavouritebook();
    if (books[book.id] == null) {
      books[book.id] = book;
    } else {
      books.remove(book.id);
    }

    return _saveFavouritebook(books);
  }

  Future _saveFavouritebook(Map<int, Book> books) async {
    var sharedPreference = await _futureSPref;

    var converted = books.map((key, value) {
      return MapEntry(key.toString(), value.toJson());
    });

    var content = json.encode(converted);

    await sharedPreference.setString(kFavouritebooks, content);
  }

  @override
  Future<Map<int, Book>> fetchFavouritebook() async {
    var sharedPreference = await _futureSPref;
    var content = sharedPreference.getString(kFavouritebooks);
    if (content == null) {
      return {};
    }

    return (json.decode(content) as Map).map((key, value) {
      return MapEntry(int.parse(key), Book.fromJson(value));
    });
  }
}
