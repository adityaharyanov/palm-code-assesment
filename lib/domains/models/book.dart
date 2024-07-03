class Author {
  final String name;
  final int birthYear;
  final int deathYear;

  Author({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });
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
}

class BookPage {
  final int count;
  final String? next;
  final String? previous;
  final List<Book> results;

  BookPage({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}