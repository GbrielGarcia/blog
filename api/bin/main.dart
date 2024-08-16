import 'dart:io';

import 'package:api/routes/quotes_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_hotreload/shelf_hotreload.dart';

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final quotesRouter = QuotesRouter();

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(quotesRouter.router);

  final server = await io.serve(handler, 'localhost', 8080);
  print('Server running on localhost:${server.port}');

  return server;
}
