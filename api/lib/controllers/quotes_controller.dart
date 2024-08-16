import '../models/quote.dart';

class QuotesController {
  final List<Quote> _quotes = [
    Quote(
        author: 'Mahatma Gandhi',
        quote: 'Sé el cambio que quieres ver en el mundo.'),
    Quote(
        author: 'Eleanor Roosevelt',
        quote: 'Nadie puede hacerte sentir inferior sin tu consentimiento.'),
    Quote(
        author: 'Leon Tolstoi',
        quote:
            'Muchos piensan en cambiar el mundo, pero casi nadie piensa en cambiarse a sí mismo.'),
    Quote(
        author: 'Maya Angelou',
        quote:
            'Podemos sufrir muchas derrotas pero no debemos ser derrotados.'),
    Quote(
        author: 'Napoleon Hill',
        quote: 'No esperes. Nunca va a ser el momento adecuado.'),
    Quote(
        author: 'Albert Einstein',
        quote: 'La creatividad es la inteligencia divirtiéndose.'),
  ];

  List<Map<String, String>> getAllQuotes() {
    return _quotes.map((quote) => quote.toJson()).toList();
  }
}
