import "package:flutter_test/flutter_test.dart";
import "package:palm_code_assessment/data/models/book.dart";

main() {
  test("Author: fromJson", () {
    var json = authorJson;

    var sut = Author.fromJson(json);

    expect(sut.name, json["name"]);
    expect(sut.birthYear, json["birth_year"]);
    expect(sut.deathYear, json["death_year"]);
  });

  test("Book: fromJson", () {
    var json = bookJson;

    var sut = Book.fromJson(json);

    expect(sut.id, json["id"]);
    expect(sut.title, json["title"]);
    expect(sut.authors.length, 1);
    expect(sut.authors[0].name, authorJson["name"]);
    expect(sut.authors[0].birthYear, authorJson["birth_year"]);
    expect(sut.authors[0].deathYear, authorJson["death_year"]);
    expect(sut.subjects.length, 7);
    expect(sut.subjects[0], json["subjects"][0]);
    expect(sut.languages.length, 1);
    expect(sut.languages[0], json["languages"][0]);
    expect(sut.formats.length, 7);
    expect(sut.formats["key"], json["formats"]["key"]);
    expect(sut.downloadCount, json["download_count"]);
  });

  test("Books: fromJson", () {
    var json = booksJson;

    var sut = Books.fromJson(json);

    expect(sut.count, json["count"]);
    expect(sut.next, json["next"]);
    expect(sut.previous, json["previous"]);
    expect(sut.results.length, 1);
    expect(sut.results[0].id, bookJson["id"]);
    expect(sut.results[0].title, bookJson["title"]);
    expect(sut.results[0].authors.length, 1);
    expect(sut.results[0].authors[0].name, authorJson["name"]);
    expect(sut.results[0].authors[0].birthYear, authorJson["birth_year"]);
    expect(sut.results[0].authors[0].deathYear, authorJson["death_year"]);
    expect(sut.results[0].subjects.length, 7);
    expect(sut.results[0].subjects[0], bookJson["subjects"][0]);
    expect(sut.results[0].languages.length, 1);
    expect(sut.results[0].languages[0], bookJson["languages"][0]);
    expect(sut.results[0].formats.length, 7);
    expect(
        sut.results[0].formats["text/html"], bookJson["formats"]["text/html"]);
    expect(sut.results[0].downloadCount, bookJson["download_count"]);
  });
}

Map<String, dynamic> get authorJson => {
      "name": "Shakespeare, William",
      "birth_year": 1564,
      "death_year": 1616,
    };

Map<String, dynamic> get bookJson => {
      "id": 1513,
      "title": "Romeo and Juliet",
      "authors": [authorJson],
      "translators": [],
      "subjects": [
        "Conflict of generations -- Drama",
        "Juliet (Fictitious character) -- Drama",
        "Romeo (Fictitious character) -- Drama",
        "Tragedies",
        "Vendetta -- Drama",
        "Verona (Italy) -- Drama",
        "Youth -- Drama"
      ],
      "bookshelves": [],
      "languages": ["en"],
      "copyright": false,
      "media_type": "Text",
      "formats": {
        "text/html": "https://www.gutenberg.org/ebooks/1513.html.images",
        "application/epub+zip":
            "https://www.gutenberg.org/ebooks/1513.epub3.images",
        "application/x-mobipocket-ebook":
            "https://www.gutenberg.org/ebooks/1513.kf8.images",
        "application/rdf+xml": "https://www.gutenberg.org/ebooks/1513.rdf",
        "image/jpeg":
            "https://www.gutenberg.org/cache/epub/1513/pg1513.cover.medium.jpg",
        "text/plain; charset=us-ascii":
            "https://www.gutenberg.org/ebooks/1513.txt.utf-8",
        "application/octet-stream":
            "https://www.gutenberg.org/cache/epub/1513/pg1513-h.zip"
      },
      "download_count": 77782,
    };

Map<String, dynamic> get booksJson => {
      "count": 73872,
      "next": "https://gutendex.com/books/?page=2",
      "previous": null,
      "results": [bookJson],
    };
