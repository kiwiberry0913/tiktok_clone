import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:tiktok_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //S.load(const Locale("ko"));
    return MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'TikTok Clone',
        localizationsDelegates: const [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("en"),
          Locale("ko"),
        ],
        themeMode: ThemeMode.system,
        theme: ThemeData(
            useMaterial3: true,
            textTheme: Typography.blackCupertino,
            brightness: Brightness.light,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: const Color(0xFFe9435a),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xFFe9435a),
            ),
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.white,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
            ),
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.grey.shade50,
            ),
            tabBarTheme: TabBarTheme(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade500,
            ),
            listTileTheme: const ListTileThemeData(
              iconColor: Colors.black,
            )),
        darkTheme: ThemeData(
          useMaterial3: true,
          textTheme: Typography.whiteCupertino,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFe9435a),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade900,
            surfaceTintColor: Colors.grey.shade900,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.grey.shade300,
            ),
            iconTheme: IconThemeData(
              color: Colors.grey.shade300,
            ),
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey.shade900,
          ),
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade700,
          ),
          scaffoldBackgroundColor: Colors.black,
          primaryColor: const Color(0xFFe9435a),
          brightness: Brightness.dark,
        ));
  }
}
