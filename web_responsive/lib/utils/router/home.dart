
import 'package:go_router/go_router.dart';
import 'package:web_responsive/main.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const Home();
      },
    )

  ],
);
