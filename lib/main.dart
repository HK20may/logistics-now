import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistics_now/core/theme/color_constants.dart';
import 'package:logistics_now/core/utils/routes/route_generator.dart';
import 'package:logistics_now/core/utils/routes/route_helper.dart';
import 'package:logistics_now/domain/firebase/firebase_options.dart';
import 'package:logistics_now/presentation/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: RouteHelper.navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      builder: (context, child) {
        // FToast().init(context);
        return MediaQuery(
          data: MediaQuery.of(context),
          child: AnnotatedRegion(
              value: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
              child: FToastBuilder()(context, child)),
        );
      },
      theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: ColorConstants.primary,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          unselectedWidgetColor: ColorConstants.splashColor),
      home: const SplashScreen(),
    );
  }
}
