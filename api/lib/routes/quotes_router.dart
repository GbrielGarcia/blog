import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/quotes_controller.dart';

class QuotesRouter {
  final QuotesController _controller = QuotesController();

  Router get router {
    final router = Router();

    // Ruta para obtener todas las frases
    router.get('/quotes', (Request request) {
      final response = json.encode(_controller.getAllQuotes());
      return Response.ok(response, headers: {'Content-Type': 'application/json'});
    });


    return router;
  }
}
