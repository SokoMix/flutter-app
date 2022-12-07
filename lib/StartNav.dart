import 'package:flutter/material.dart';
import 'SourceView/HomeWidget.dart';
import 'SourceView/AuthWidget.dart';
import 'SourceView/NewAccWidget.dart';
import 'SourceView/Controller.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StartNav extends StatelessWidget {
  final Controller controller;

  StartNav(this.controller);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType)
    {
      return MaterialApp(
        routes: {
          '/': (context) => AuthView(controller: controller),
          '/home_page': (context) => HomePage(controller: controller),
          '/new_acc': (context) => NewAccWidget(controller: controller),
        },
      );
    });
  }
}

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args;
//     if (settings.arguments != null) {
//       args = settings.arguments as List;
//     } else {
//       args = null;
//     }
//
//     switch (settings.name) {
//       case '/':
//         return PageTransition(
//           child: AuthView(),
//           settings: const RouteSettings(name: '/'),
//           type: PageTransitionType.fade,
//         );
//       case '/home_page':
//         return PageTransition(
//           child: const HomePage(),
//           settings: const RouteSettings(name: '/home_page'),
//           type: PageTransitionType.fade,
//         );
//       default:
//         return _errorRoute();
//     }
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return PageTransition(
//       child: const Center(child: Text("Error loading")),
//       settings: const RouteSettings(name: "/error"),
//       type: PageTransitionType.fade,
//     );
//   }
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveSizer(builder: (context, orientation, screenType) {
//       return MaterialApp(
//         home: HeroControllerScope(
//           controller: MaterialApp.createMaterialHeroController(),
//           child: const Navigator(
//             initialRoute: '/',
//             onGenerateRoute: RouteGenerator.generateRoute,
//           ),
//         ),
//       );
//     });
//   }
// }
