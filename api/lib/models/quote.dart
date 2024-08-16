class Quote {
  final String author;
  final String quote;

  Quote({required this.author, required this.quote});

  // Método para convertir un Quote a un Map
  Map<String, String> toJson() {
    return {'author': author, 'quote': quote};
  }

}
