import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cv_send/_childrens/init/bloc/bloc.dart' as init;
import 'package:cv_send/config/app.dart';
import 'package:cv_send/module.dart';
import 'package:cv_send/utils/http/http_client.dart';
import 'package:cv_send/utils/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await App.instance.init();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<init.Bloc>(
          create: (context) => init.Bloc(
            prefs: Modular.get<Preferences>(),
            httpClient: Modular.get<XigoHttpClient>(),
          )..add(init.InitEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Wilver Rojas',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: GoogleFonts.nunitoSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
