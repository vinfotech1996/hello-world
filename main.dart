import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/yoga/YogaSchedulerHome.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';


import 'IconTextRow.dart';
import 'fav_screen.dart';
import 'my_provider_data.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZone();
  await _requestNotificationPermission();
  runApp(const MyApp());
}

void initializeTimeZone() {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
}

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void _initializeNotifications() async {
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidInit);
  await _flutterLocalNotificationsPlugin.initialize(initSettings);
  await _createNotificationChannel();
}

Future<void> _createNotificationChannel() async {
  const androidChannel = AndroidNotificationChannel(
    'yoga_channel',
    'Yoga Notifications',
    description: 'Notifications for Yoga schedules',
    importance: Importance.max,
  );
  await _flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidChannel);
  await _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  await _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestExactAlarmsPermission();
}

Future<void> _requestNotificationPermission() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Notch Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home:   YogaSchedulerHome(),
     /* home: ChangeNotifierProvider(
        create: (_) => MyProviderData(),
        child: FavScreen(),
      ),*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    const Page3(),
    // const Page4(),
    // const Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: Colors.white,
        showLabel: false,
        notchColor: Colors.black87,

        /// restart app if you change removeMargins
        removeMargins: true,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
          // const BottomBarItem(
          //   inActiveItem: Icon(
          //     Icons.star,
          //     color: Colors.blueGrey,
          //   ),
          //   activeItem: Icon(
          //     Icons.star,
          //     color: Colors.blueAccent,
          //   ),
          //   itemLabel: 'Page 2',
          // ),

          ///svg example
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              'assets/search_icon.svg',
              color: Colors.blueGrey,
            ),
            activeItem: SvgPicture.asset(
              'assets/search_icon.svg',
              color: Colors.white,
            ),
            itemLabel: 'Page 3',
          ),
          // const BottomBarItem(
          //   inActiveItem: Icon(
          //     Icons.settings,
          //     color: Colors.blueGrey,
          //   ),
          //   activeItem: Icon(
          //     Icons.settings,
          //     color: Colors.pink,
          //   ),
          //   itemLabel: 'Page 4',
          // ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.yellow,
            ),
            itemLabel: 'Page 5',
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          log('current selected index $index');
          _pageController.jumpToPage(index);
        },
      )
          : null,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 5')));
  }
}