import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/providers/multi_provider.dart';
import 'package:movieapp/res/res.dart';
import 'package:movieapp/routes/routes.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.mainHomeScreen,
        routes: Routes.routes,
      ),
    );
  }
}
