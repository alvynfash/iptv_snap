import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iptv_snap/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Color get bgColor => Color(0xffF0F3F4);
  static Color blueTheme = Color(0xff0243BE);
  static Color lightBlueTheme = Color(0xff00B1EC);
  static Color greenTheme = Color(0xff40B193);
  static Color greyTheme = Color(0xff8193A4);
  static Color bgTheme = Color(0xffF5F6FA);

  static BoxDecoration defaultThemedBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        MyApp.greenTheme,
        MyApp.lightBlueTheme,
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
  );

  static BoxDecoration defaultRoundedBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
  );

  static BoxDecoration defaultRoundedBottomBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    ),
  );

  static BoxDecoration defaultRoundedTopBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  );

  static RoundedRectangleBorder defaultRoundedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => HomeScreen(),
            transition: Transition.zoom,
          ),
          GetPage(
            name: 'channels',
            page: () => ChannelsScreen(),
            transition: Transition.zoom,
          ),
          GetPage(
            name: 'player',
            page: () => PlayerScreen(),
            transition: Transition.fade,
          ),
          GetPage(
            name: 'playlist',
            page: () => PlaylistSetupScreen(),
            transition: Transition.zoom,
          ),
        ]);
  }
}
