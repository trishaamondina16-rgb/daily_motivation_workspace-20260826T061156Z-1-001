import 'exceptions.dart';

class Motivation {
  final String id;
  final String quote;
  final String author;
  final String category;

  const Motivation({
    required this.id,
    required this.quote,
    required this.author,
    required this.category,
  });

  factory Motivation.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String parsedId,
        'quote': String parsedQuote,
        'author': String parsedAuthor,
        'category': String parsedCategory,
      } =>
        Motivation(
          id: parsedId,
          quote: parsedQuote,
          author: parsedAuthor,
          category: parsedCategory,
        ),

      _ => throw DailyMotivationException(
          'Motivation payload failed pattern validation.',
        ),
    };
  }
}