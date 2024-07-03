import "package:palm_code_assessment/domains/models/book.dart" as domain;

class Author {
  final String name;
  final int birthYear;
  final int deathYear;

  Author(
      {required this.name, required this.birthYear, required this.deathYear});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'],
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
    );
  }

  domain.Author toDomain() {
    return domain.Author(
      name: name,
      birthYear: birthYear,
      deathYear: deathYear,
    );
  }
}

class Book {
  final int id;
  final String title;
  final List<Author> authors;
  final List<String> subjects;
  final List<String> languages;
  final Map<String, String> formats;
  final int downloadCount;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.subjects,
    required this.languages,
    required this.formats,
    required this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    var list = json['authors'] as List;
    List<Author> authorsList = list.map((i) => Author.fromJson(i)).toList();

    return Book(
      id: json['id'],
      title: json['title'],
      authors: authorsList,
      subjects: json['subjects'].cast<String>(),
      languages: json['languages'].cast<String>(),
      formats: json['formats'].cast<String, String>(),
      downloadCount: json['download_count'],
    );
  }

  domain.Book toDomain() {
    return domain.Book(
      id: id,
      title: title,
      authors: authors.map((e) => e.toDomain()).toList(),
      subjects: subjects,
      languages: languages,
      formats: formats,
      downloadCount: downloadCount,
    );
  }
}

class Books {
  final int count;
  final String? next;
  final String? previous;
  final List<Book> results;

  Books({required this.count, this.next, this.previous, required this.results});

  factory Books.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Book> booksList = list.map((i) => Book.fromJson(i)).toList();

    return Books(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: booksList,
    );
  }

  domain.BookPage toDomain() {
    return domain.BookPage(
      count: count,
      next: next,
      previous: previous,
      results: results.map((e) => e.toDomain()).toList(),
    );
  }
}
