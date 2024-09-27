
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_responsive/home/sign/welcome.dart';

import 'package:web_responsive/providers/providers.dart';
import 'package:web_responsive/utils/router/router.dart';
import 'package:web_responsive/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]).then(
    (_) => runApp(
      MultiProvider(
        providers: [

          ChangeNotifierProvider<AccountStateProvider>(
              create: (_) => AccountStateProvider()),
          ChangeNotifierProvider<CountryProvider>(
              create: (_) => CountryProvider()),

        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final accountSwitchProvider = Provider.of<AccountStateProvider>(context);

    return Scaffold(
      // body: EditProductsScreenSuppliersDashboard(),
      // body: HomeScreenSuppliersDashboard(),
      body: Responsive(
        mobile: accountSwitchProvider.currentState.screen,
        desktop: Row(
          children: [
            const WelcomeSingHome(),
            accountSwitchProvider.currentState.screen,
          ],
        ),
      ),
    );
  }
}
