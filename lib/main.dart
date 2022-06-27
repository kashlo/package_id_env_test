import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
late PackageInfo packageInfo;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   packageInfo = await PackageInfo.fromPlatform();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('name: ${appName}', style: TextStyle(fontSize: 22),),
            Text('id: ${packageName}', style: TextStyle(fontSize: 22)),
            Text('1 ${EnvironmentConfig.DEFTEST_APP_ID}'),
            // Text('2 ${EnvironmentConfig.OTHER_VAR}'),

          ],
        )
    );
  }
}

class EnvironmentConfig {
  static const DEFTEST_APP_ID = String.fromEnvironment('DEFTEST_APP_ID');
  // static const OTHER_VAR = String.fromEnvironment('OTHER_VAR');
}