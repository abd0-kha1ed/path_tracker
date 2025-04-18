import 'package:flutter/material.dart';
import 'package:robotics_app/feature/camera/presentation/views/camera_view.dart';
import 'package:robotics_app/feature/connection/presentation/view/connection_view.dart';
import 'package:robotics_app/feature/control/presentation/views/control_view.dart';
import 'package:robotics_app/feature/data/presentation/views/data_view.dart';
import 'package:robotics_app/feature/home/presentation/view/home_view.dart';
import 'package:robotics_app/feature/members/presentation/views/members_veiw.dart';
import 'package:robotics_app/feature/spalsh/presentation/view/splash_view.dart';
// Camera Page

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case ConnectionView.routeName:
      return MaterialPageRoute(builder: (_) => const ConnectionView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());

    //! Adding the four new pages for navigation
    case ControlView.routeName:
      return MaterialPageRoute(builder: (_) => const ControlView());
    case DataView.routeName:
      return MaterialPageRoute(builder: (_) => const DataView());
    case MembersView.routeName:
      return MaterialPageRoute(builder: (_) => const MembersView());
    case CameraView.routeName:
      return MaterialPageRoute(builder: (_) => const CameraView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
